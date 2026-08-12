#############################################################
#                          Autosurf                         #
#                       Autor : Bezier                      #
#               Compatible con Essentials 16.3              #
#                                                           #
# Este script plug&play permite surfear de forma automática #
# cuando se entra en contacto con un terrain tag surfeable  #
#############################################################
 
# Poner a true si Surf se activa con las medallas
AUTOSURF_USEBADGES = false
 
# Poner a true si Surf se activa con un objeto
AUTOSURF_USEITEM = false
# Objeto que permite hacer autosurf
AUTOSURF_ITEM_KEY = :SURF_ITEM
 
def pbAutoSurf
  x=$game_player.x
  y=$game_player.y
  currentTag=$game_map.terrain_tag(x,y)
  facingTag=pbFacingTerrainTag
  if !$PokemonGlobal.surfing && $game_player.pbFacingTerrainTag.can_surf
    return if !($game_map.metadata&.has_flag?("dungeonDisplay") && $game_switches[60])
    # Cancela el Surf si está activo por medallas y no se cumple la condición para surf
    # return if AUTOSURF_USEBADGES && !(Settings::FIELD_MOVES_COUNT_BADGES ? $player.badge_count >= Settings::BADGE_FOR_SURF : $player.badges[Settings::BADGE_FOR_SURF])
    # Cancela el Surf si está activo por objeto pero no se posee el objeto que permite surfear
    # return if AUTOSURF_USEITEM && !($bag.has?(AUTOSURF_ITEM_KEY) && $bag.quantity(AUTOSURF_ITEM_KEY)>0)
 
    # Compatibilidad con PokémonFollow para hacer desaparecer al pokémon
    # $PokemonTemp.dependentEvents.check_surf(true) if defined?($PokemonTemp.dependentEvents.check_surf)
    $game_player.straighten
    $game_map.update
    if !$game_switches[70]
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]It appears this area cannot be traversed by foot."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]How will you proceed?"), [
          _INTL("If only there were a floating horse to help..."),
          _INTL("Got any ideas, Mr. Flying horse?"),
      ], -1)
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]I suppose... It's only fair that I lend you a hand with this."))
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]Please don't make me work too hard."))
      Mugshot.dispose
      $game_switches[70] = true
    end
    pbStartSurfing
    return true
  end
  return false
end

class Game_Player < Game_Character
  def move_generic(dir, turn_enabled = true)
    turn_generic(dir) if turn_enabled
    if can_move_in_direction?(dir)
      turn_generic(dir)
      @move_initial_x = @x
      @move_initial_y = @y
      @x += (dir == 4) ? -1 : (dir == 6) ? 1 : 0
      @y += (dir == 8) ? -1 : (dir == 2) ? 1 : 0
      @move_timer = 0.0
      increase_steps
    else
      check_event_trigger_touch(dir)
    end
  end
  
  def move_down(turn_enabled = true)
    if turn_enabled
      turn_down
    end
    if passable?(@x, @y, 2)
      return if pbEndSurf(0,1)
      move_generic(2, turn_enabled)
    elsif !pbAutoSurf 
      if !check_event_trigger_touch(2)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_left(turn_enabled = true)
    if turn_enabled
      turn_left
    end
    if passable?(@x, @y, 4)
      return if pbEndSurf(-1,0)
      move_generic(4, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(4)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_right(turn_enabled = true)
    if turn_enabled
      turn_right
    end
    if passable?(@x, @y, 6)
      return if pbEndSurf(1,0)
      move_generic(6, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(6)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
  
  def move_up(turn_enabled = true)
    if turn_enabled
      turn_up
    end
    if passable?(@x, @y, 8)
      return if pbEndSurf(0,-1)
      move_generic(8, turn_enabled)
    elsif !pbAutoSurf
      if !check_event_trigger_touch(8)
        if !@bump_se || @bump_se<=0
          pbSEPlay("bump"); @bump_se=10
        end
      end
    end
  end
end