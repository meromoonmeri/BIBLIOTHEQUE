#Gibmaker

def findpath(x,y)
  $game_player.force_move_route(Pathfinder.new($game_player,x,y).move_route)
end

def findpathevent(event,x,y)
  event_id=event
  $game_map.events[event_id].force_move_route(Pathfinder.new($game_map.events[event_id],x,y).move_route)
end

class Pathfinder
  #============================================================================
  # * Invariants
  #============================================================================
  DIRS = [2, 4, 6, 8]
  #============================================================================
  # * Publics
  #============================================================================
  @@terminals = []
  attr_reader :path_coords
  attr_reader :path_dirs
  #============================================================================
  # * Terminals
  #   Make the terminals publickly available so they can be ignored by
  #   passability checks
  #============================================================================
  def self.terminals
    @@terminals
  end
  #============================================================================
  # * Initialize
  #   Deploy based on arguments
  #     Arguments can be two events, an event and a coordinate set, or
  #     two pairs of coordinate sets.
  #============================================================================
  def initialize(*args)
    if args[0].kind_of? Game_Character and args[1].kind_of? Game_Character
      setup(args[0].x, args[0].y, args[1].x, args[1].y, args[0], args[1])
    elsif args[0].kind_of? Game_Character and args[1].kind_of? Numeric
      setup(args[0].x, args[0].y, args[1], args[2], args[0])
    else
      setup(*args)
    end
  end
  #============================================================================
  # * Initialize
  #   The path is filled out immediately
  #============================================================================
  def setup(start_x, start_y, goal_x, goal_y, event,
      target = nil, known_max = nil)
    @start_x = start_x
    @start_y = start_y
    @goal_y = goal_y
    @goal_x = goal_x
    @event = event
    # Program terminals
    @@terminals = [event, target]
    # Initialize working variables
    # @steps plots the number of actual steps that were taken to reach a spot
    @steps = Table.new($game_map.width, $game_map.height)
    # Holds all nodes that are open but not visited yet
    @live_nodes = {}
    # Set constraint
    if known_max
      # Explore every possible route within the given maximum distance
      @constraint = { :type => :known_maximum, :value => known_max }
    else
      # No known route length yet, so prefer stepping toward the target
      @constraint = { :type => :minimum_expected_distance }
    end
    # Set the starting position
    open(start_x, start_y, 1)
    # Find a path!
    if program_path
      set_path_coords
      # Check for a path using the known_max paradigm; compare
      if @constraint[:type] == :minimum_expected_distance
        alt_path = Pathfinder.new(@start_x, @start_y, @goal_x, @goal_y,
          event, target, length )
        if alt_path.length < length
          @path_coords = alt_path.path_coords
        end
      end
      set_path_dirs
    else
      @path_coords = []
      @path_dirs = []
    end
    # Clean up temp variables
    @@terminals.clear
    @steps = @live_nodes = nil
  end
  #============================================================================
  # * Distance to goal
  #   The minimum possible steps to reach the goal + 1, assuming there are no
  #   obstacles in the way.
  #   +1 because the default starting value for the table is 0 in all positions
  #   so the goal tile itself will receive a value of 1
  #============================================================================
  def distance(x, y)
    (x - @goal_x).abs + (y - @goal_y).abs + 1
  end
  #============================================================================
  # * Coords at
  #============================================================================
  def coords_at(x, y, dir)
    return x + (dir == 6 ? 1 : dir == 4 ? -1 : 0),
           y + (dir == 2 ? 1 : dir == 8 ? -1 : 0)
  end
  #============================================================================
  # * Passable from tile
  #============================================================================
  def passable?(x, y, dir)
    if @event
      return @event.passable?(x, y, dir)
    end
    return ($game_map.valid?(other_x, other_y) and
            $game_map.passable?( x, y, dir, *@details ) and
            $game_map.passable?( other_x, other_y, 10-dir, *@details ))
  end
  #============================================================================
  # * Open tile for checking
  #   Assumption is that this tile is unexplored and not all ready open
  #============================================================================
  def open(x, y, steps)
    @steps[x, y] = steps
    dist = distance(x, y)
    unless distance_set = @live_nodes[dist]
      distance_set = []
      @live_nodes[dist] = distance_set
    end
    distance_set.push( [x, y] ) unless distance_set.find{ |node| node == [x, y]}
  end
  #============================================================================
  # * Close tile
  #   Assumption is that the tile is validly open
  #============================================================================
  def close(x, y)
    # Remove the node from the distance set.
    dist = distance(x, y)
    distance_set = @live_nodes[dist]
    distance_set.delete( distance_set.find { |node| node == [x, y] } )
    # Remove the set if it's empty
    @live_nodes.delete(dist) if distance_set.empty?
  end
  #============================================================================
  # * All nodes
  #============================================================================
  def all_nodes
    set = []
    @live_nodes.values.each { |value| set += value }
    set
  end
  #============================================================================
  # * Find path
  #   Explore the environment and determine if a path is available, programming
  #   the @steps table with the number of steps required to reach each position
  #============================================================================
  def program_path
    # Kill if start or goal are not valid
    return false unless $game_map.valid?(@start_x, @start_y) and
                        $game_map.valid?(@goal_x, @goal_y)
    # Kill if goal can't be stepped onto from any direction
    return false if DIRS.select { |dir|
      passable?(@goal_x, @goal_y, dir)
    }.empty?
    # Run until there are no more live nodes.
    # Running out of live nodes means there was no path.
    until @live_nodes.empty?
      # If the goal has been opened (distance of 1)
      if (minimum_distance = @live_nodes.keys.min) == 1
        return true
      end
      # For all open tiles with the smallest distance to the target ...
      #@live_nodes[ minimum_distance ].dup.each { |node|
      case @constraint[:type]
      when :minimum_expected_distance
        check_set = @live_nodes[ minimum_distance ].dup
      when :known_maximum
        check_set = all_nodes
      end
      check_set.each { |node|
        # Open the tiles in all four directions, if it is possible to pass
        # in that direction
        DIRS.each { |dir|
          if passable?( node[0], node[1], dir )
            x, y = *coords_at( node[0], node[1], dir )
            # If there is a max distance constraint
            if @constraint[:type] == :known_maximum
              # Thanks to applying +1 to distance and steps (in order to use
              # 0 to represent an unvisited position) there are a bunch of
              # +1 corrections in this comparison, which combine into the +3
              # adjustment.
              next if distance(x, y) >= @constraint[:value] - @steps[ *node ] + 3
            end
            # If the tile has not all ready been opened, open it now
            if @steps[x, y] == 0 or @steps[x, y] > @steps[ *node ] + 1
              open( x, y, @steps[ *node ] + 1 )
            end
          end
        }
        close *node
      }
    end
    return false
  end
  #============================================================================
  # * Set path_coords
  #   With @steps programmed, start at the goal and work backwards to find
  #   a valid path.  Assumes that there is such a path.
  #============================================================================
  def set_path_coords
    # Set the coord-based path
    @path_coords = []
    x, y = @goal_x, @goal_y
    while ( [x, y] != [@start_x, @start_y] ) do
      # Add this point to the path
      @path_coords.push( [x, y] )
      choices = []
      min_dist = nil
      DIRS.each { |dir|
        # Possible to step in this direction?
        new_x, new_y = *coords_at(x, y, dir)
        next unless passable?( new_x, new_y, 10 - dir )
        # Get the coords
        check_x, check_y = *coords_at(x, y, dir)
        # Unexplored tile?
        next if @steps[check_x, check_y] == 0
        # Not a backtrack?
        next unless @steps[check_x, check_y] < @steps[x, y]
        # Process choice
        if min_dist.nil? or @steps[check_x, check_y] <= min_dist
          choices.clear
          min_dist = @steps[check_x, check_y]
        end
        if @steps[check_x, check_y] == min_dist
          choices.push( [check_x, check_y ] )
        end
      }
      p @path_coords if choices.empty?
      x, y = *choices[rand( choices.size )]
    end
    @path_coords.push( [@start_x, @start_y] )
    @path_coords.reverse!
  end
  #============================================================================
  # * Set path_dirs
  #   With @path_coords programmed, create a path consisting of directions.
  #============================================================================
  def set_path_dirs
    @path_dirs = []
    if @path_coords.size > 1
      0.upto(@path_coords.size - 2) { |i|
        here, there = @path_coords[i], @path_coords[i + 1]
        if here[0] == there[0]
          @path_dirs.push( here[1] > there[1] ? 8 : 2 )
        else
          @path_dirs.push( here[0] > there[0] ? 4 : 6 )
        end
      }
    end
  end
  #============================================================================
  # * Print table
  #============================================================================
  def print_table(table)
    print_string = ""
    0.upto(table.ysize - 1) { |y|
      0.upto(table.xsize - 1) { |x|
          print_string << ("000" + table[x, y].to_s)[-3, 3] << " "
      }
      print_string << "\n"
    }
    print print_string
  end
  #============================================================================
  # * The length of the path
  #============================================================================
  def length
    @path_coords.length - 1
  end
  #============================================================================
  # * The first direction of passage
  #============================================================================
  def first_direction
    @path_dirs[0]
  end
  #============================================================================
  # * Next direction to step in from a particular spot
  #============================================================================
  def next_direction_from(x, y)
    index = @path_coords.index( @path_coords.find{ |node| node == [x, y] } )
    return nil if index == nil or index == @path_coords.size - 1
    return @path_dirs[index]
  end
  #============================================================================
  # * Move route
  #============================================================================
  def move_route
    route = RPG::MoveRoute.new
    route.repeat = false
    route.list.clear
    @path_dirs.each { |dir|
      command = RPG::MoveCommand.new
      command.code = dir / 2
      route.list.push command
    }
    route.list.push RPG::MoveCommand.new
    route
  end
end
