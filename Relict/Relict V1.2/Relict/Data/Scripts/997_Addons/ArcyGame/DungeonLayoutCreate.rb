#===============================================================================#
$layoutStage = 0

module Input
  class << self
    unless method_defined?(:layout_key_update)
      alias_method :layout_key_update, :update
    end

    def update
      layout_key_update
      if $game_temp && !$game_temp.in_battle && $scene.is_a?(Scene_Map) && $game_map && $game_map.metadata&.has_flag?("dungeonDisplay") && trigger?(Input::AUX1)
        $layoutStage += 1
        $layoutStage = 0 if $layoutStage > 2
        rewriteDungeonLayoutAll
      end
    end
  end
end

class PokemonGlobalMetadata
    attr_accessor :saveDungeonLayout
    attr_accessor :saveLayoutCoordinates
    attr_accessor :sawStairs
  
    def saveDungeonLayout
        return @saveDungeonLayout || nil
    end

    def saveLayoutCoordinates
        return @saveLayoutCoordinates || nil
    end

    def sawStairs
      return @sawStairs || false
    end

end

def draw_saved_dungeon_from_string(dungeon_string, border_thickness = 2)
  echoln "Redrawing map layout..."
  lines = dungeon_string.lines.map(&:chomp)
  max_width = lines.map(&:size).max
  lines.map! { |line| line.ljust(max_width) }  # pad shorter lines with spaces

  height = lines.size
  width  = max_width
  tile_size = ($layoutStage == 0) ? 4 : 8

  bmp_width = width * tile_size
  bmp_height = height * tile_size
  bmp = Bitmap.new(bmp_width, bmp_height)

  # Define colors
  char_colors = {
    '#' => Color.new(0, 0, 0, 0)  # Blue floor
  }

  height.times do |y|
    width.times do |x|
      char = lines[y][x]
      next unless char
      color = char_colors[char] || Color.new(0, 0, 0, 56)  # Red fallback

      px = x * tile_size
      py = y * tile_size

      bmp.fill_rect(px, py, tile_size, tile_size, color)

      next unless char == '#'

      # Side outlines
      [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |dx, dy|
        nx, ny = x + dx, y + dy
        next if nx < 0 || ny < 0 || nx >= width || ny >= height
        neighbor = lines[ny][nx]
        next if neighbor == '#'

        case [dx, dy]
        when [-1, 0]  # Left
          bmp.fill_rect(px, py, border_thickness, tile_size, Color.new(255, 255, 255, 56))
        when [1, 0]   # Right
          bmp.fill_rect(px + tile_size - border_thickness, py, border_thickness, tile_size, Color.new(255, 255, 255, 56))
        when [0, -1]  # Top
          bmp.fill_rect(px, py, tile_size, border_thickness, Color.new(255, 255, 255, 56))
        when [0, 1]   # Bottom
          bmp.fill_rect(px, py + tile_size - border_thickness, tile_size, border_thickness, Color.new(255, 255, 255, 56))
        end
      end

      # Corner outlines (diagonals)
      [
        [-1, -1, px, py],                                             # Top-left
        [1, -1, px + tile_size - border_thickness, py],               # Top-right
        [-1, 1, px, py + tile_size - border_thickness],               # Bottom-left
        [1, 1, px + tile_size - border_thickness, py + tile_size - border_thickness] # Bottom-right
      ].each do |dx, dy, ox, oy|
        nx, ny = x + dx, y + dy
        adj1 = [x + dx, y]
        adj2 = [x, y + dy]
        next if nx < 0 || ny < 0 || nx >= width || ny >= height
        next if lines[ny][nx] == '#' || lines[adj1[1]][adj1[0]] != '#' || lines[adj2[1]][adj2[0]] != '#'
        bmp.fill_rect(ox, oy, border_thickness, border_thickness, Color.new(255, 255, 255, 56))
      end
    end
  end

  sprite = Sprite.new
  sprite.bitmap = bmp
  sprite.bitmap.clear if $layoutStage == 2
  sprite.x = -24
  sprite.y = -24
  return sprite
end

def create_events_dot_sprite(tile_size = 8)
  echoln "Redrawing map events..."

  # Determine tile size and icon sheet
  if $layoutStage == 0
    tile_size = 4
    icon_path = "Graphics/UI/overlayUI/iconsOverlaySmall"
    icon_size = 8
    stairs_icon_x = 8
  else
    tile_size = 8
    icon_path = "Graphics/UI/overlayUI/iconsOverlayBig"
    icon_size = 16
    stairs_icon_x = 16
  end

  # Load icon sheet
  icon_bitmap = Bitmap.new(icon_path)

  # Prepare main bitmap
  width = $PokemonGlobal.saveDungeonLayout.lines.first.chomp.size * tile_size
  height = $PokemonGlobal.saveDungeonLayout.lines.size * tile_size
  bmp = Bitmap.new(width, height)

  $game_map.events.each_value do |event|
    next if event == $game_player  # skip player
    next if event.character_name == ""
    next if (!event.name.include?("item") && !event.name.include?("dialogue_poke") && !event.name.include?("stairs") && !event.name.include?("gold"))
    next if event.name.include?("stairs") && !$PokemonGlobal.sawStairs

    ev_x = event.x * tile_size
    ev_y = event.y * tile_size

    # Determine which icon to use
    if event.name.include?("stairs")
      icon_x = icon_size  # 16 for big, 8 for small
    elsif event.name.include?("item") || event.name.include?("gold")
      icon_x = icon_size * 2  # 32 or 16
    else
      icon_x = icon_size * 3  # 48 or 24
    end

    icon_source_rect = Rect.new(icon_x, 0, icon_size, icon_size)

    # Center icon in tile
    offset_x = (tile_size - icon_size) / 2
    offset_y = (tile_size - icon_size) / 2

    bmp.blt(ev_x + offset_x, ev_y + offset_y, icon_bitmap, icon_source_rect)
  end

  # Create sprite
  sprite = Sprite.new
  sprite.bitmap = bmp
  sprite.bitmap.clear if $layoutStage == 2
  sprite.z = 51
  sprite.x = -24
  sprite.y = -24

  return sprite
end

def create_player_dot_sprite(tile_size = 8)
  # Determine tile size and icon details based on layout stage
  if $layoutStage == 0
    tile_size = 4
    icon_path = "Graphics/UI/overlayUI/iconsOverlaySmall"
    icon_source_rect = Rect.new(0, 0, 8, 8)
  else
    tile_size = 8
    icon_path = "Graphics/UI/overlayUI/iconsOverlayBig"
    icon_source_rect = Rect.new(0, 0, 16, 16)
  end

  # Calculate player position in pixels
  player_x = $game_player.x
  player_y = $game_player.y
  px = player_x * tile_size
  py = player_y * tile_size

  # Create bitmap same size as dungeon map sprite
  width = $PokemonGlobal.saveDungeonLayout.lines.first.chomp.size * tile_size
  height = $PokemonGlobal.saveDungeonLayout.lines.size * tile_size
  bmp = Bitmap.new(width, height)

  # Load the appropriate icon image
  icon_bitmap = Bitmap.new(icon_path)

  # Optionally center the icon within the tile
  icon_width = icon_source_rect.width
  icon_height = icon_source_rect.height
  offset_x = (tile_size - icon_width) / 2
  offset_y = (tile_size - icon_height) / 2

  # Draw the icon at the calculated position
  bmp.blt(px + offset_x, py + offset_y, icon_bitmap, icon_source_rect)

  # Create the sprite
  sprite = Sprite.new
  sprite.bitmap = bmp
  sprite.bitmap.clear if $layoutStage == 2
  sprite.z = 51
  sprite.x = -24
  sprite.y = -24

  return sprite
end

EventHandlers.add(:on_map_or_spriteset_change, :show_dungeon_map,
  proc { |scene, _map_changed|
    next if !scene || !scene.spriteset
    map_metadata = $game_map.metadata
    if map_metadata&.has_flag?("dungeonDisplay")
      $PokemonGlobal.sawStairs = false
      $game_temp.dungeon_layout_sprite = draw_saved_dungeon_from_string($PokemonGlobal.saveDungeonLayout)
      $game_temp.dungeon_player = create_player_dot_sprite
      $game_temp.dungeon_events = create_events_dot_sprite
      scene.spriteset.addUserSprite($game_temp.dungeon_layout_sprite)
      scene.spriteset.addUserSprite($game_temp.dungeon_player)
      scene.spriteset.addUserSprite($game_temp.dungeon_events)
      if !$PokemonGlobal.sawStairs && stairsInRange?
        echoln "Saw stairs for the first time."
        $PokemonGlobal.sawStairs = true
        refreshEventsDungeonLayout 
      end
    else
      $game_temp.dungeon_layout_sprite&.dispose
      $game_temp.dungeon_layout_sprite = nil
      $game_temp.dungeon_player&.dispose
      $game_temp.dungeon_player = nil
      $game_temp.dungeon_events&.dispose
      $game_temp.dungeon_events = nil
    end
  }
)

def stairsInRange?
  player_x = $game_player.x
  player_y = $game_player.y

  $game_map.events.each_value do |event|
    next if !event.name.include?("stairs")

    dx = (event.x - player_x).abs
    dy = (event.y - player_y).abs

    if dx <= 10 && dy <= 7
      return true
    end
  end

  return false
end

EventHandlers.add(:on_player_step_taken, :change_dungeon_map,
  proc { 
    next unless $game_map.metadata&.has_flag?("dungeonDisplay")
    refresPlayerDungeonLayout
    if !$PokemonGlobal.sawStairs && stairsInRange?
      echoln "Saw stairs for the first time."
      $PokemonGlobal.sawStairs = true
      refreshEventsDungeonLayout 
    end
  }
)

def refresPlayerDungeonLayout
  $game_temp.dungeon_player&.dispose
  $game_temp.dungeon_player = nil
  $game_temp.dungeon_player = create_player_dot_sprite
  $scene.spriteset.addUserSprite($game_temp.dungeon_player)
end

def refreshEventsDungeonLayout
  $game_temp.dungeon_events&.dispose
  $game_temp.dungeon_events = nil
  $game_temp.dungeon_events = create_events_dot_sprite
  $scene.spriteset.addUserSprite($game_temp.dungeon_events)
end

def rewriteDungeonLayoutAll
  $game_temp.dungeon_layout_sprite&.dispose
  $game_temp.dungeon_layout_sprite = nil
  $game_temp.dungeon_player&.dispose
  $game_temp.dungeon_player = nil
  $game_temp.dungeon_events&.dispose
  $game_temp.dungeon_events = nil

  $game_temp.dungeon_layout_sprite = draw_saved_dungeon_from_string($PokemonGlobal.saveDungeonLayout)
  $game_temp.dungeon_player = create_player_dot_sprite
  $game_temp.dungeon_events = create_events_dot_sprite

  $scene.spriteset.addUserSprite($game_temp.dungeon_layout_sprite)
  $scene.spriteset.addUserSprite($game_temp.dungeon_player)
  $scene.spriteset.addUserSprite($game_temp.dungeon_events)
end

class Game_Temp
    attr_accessor :dungeon_layout_sprite
    attr_accessor :dungeon_player
    attr_accessor :dungeon_events
end