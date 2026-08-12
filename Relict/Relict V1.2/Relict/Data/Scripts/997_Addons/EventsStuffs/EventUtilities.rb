def arcySurprise
  mallie = $game_player
  arcy = $game_map.events[1]

  case mallie.direction
  when 2
    arcy.moveto(mallie.x, mallie.y - 1)
  when 8
    arcy.moveto(mallie.x, mallie.y + 1)
  when 6
    arcy.moveto(mallie.x - 1, mallie.y)
  when 4
    arcy.moveto(mallie.x + 1, mallie.y)
  end

  arcy.direction = mallie.direction
end

class Spriteset_Map

  def self.viewport3
    return @@viewport3
  end
  
end

$light_effects ||= {}
# should be ok

def pbLightEffect(id, position, size = 1, opacity = 255)
  position = pbMapInterpreter.get_character(position).id unless position.is_a?(Array)

  if position.is_a?(Array)
    pixel_x = position[0] * Game_Map::TILE_WIDTH + Game_Map::TILE_WIDTH / 2
    pixel_y = position[1] * Game_Map::TILE_HEIGHT + Game_Map::TILE_HEIGHT / 2
  else
    event = $game_map.events[position]
    pixel_x = event.x * Game_Map::TILE_WIDTH + Game_Map::TILE_WIDTH / 2
    pixel_y = event.y * Game_Map::TILE_HEIGHT + Game_Map::TILE_HEIGHT / 2 - 16
  end

  effect_instance = LightCircleEffect.new(pixel_x, pixel_y, Spriteset_Map.viewport3, size, opacity)
  $scene.spriteset.addUserSprite(effect_instance) if $scene

  $light_effects[id] = effect_instance
end

def pbDeleteLightEffect(id)
  effect = $light_effects[id]
  return unless effect

  effect.dispose if effect.respond_to?(:dispose)

  $light_effects.delete(id)
end

class LightCircleEffect
  def initialize(world_x = 0, world_y = 0, viewport = nil, scale = 1.0, shine_opacity = 255)
    @world_x       = world_x
    @world_y       = world_y
    @viewport      = viewport || Spriteset_Map.viewport
    @disposed      = false
    @delta         = 3.0
    @scale         = scale
    @shine_opacity = shine_opacity
    @sprites       = {}
    setup
  end

  def setup
    s = Sprite.new(@viewport)
    s.bitmap     = pbBitmap("Graphics/EBDX/Transitions/Arceus/shine")
    s.center!
    s.x          = @world_x - $game_map.display_x / 4
    s.y          = @world_y - $game_map.display_y / 4
    s.opacity    = @shine_opacity
    s.toggle     = 1
    s.blend_type = 1
    s.zoom_x     = @scale
    s.zoom_y     = @scale
    @sprites["shine"] = s
  end

  def update
    return if @disposed
    s = @sprites["shine"]

    # keep sprite centered on world position
    s.x = @world_x - $game_map.display_x / 4
    s.y = @world_y - $game_map.display_y / 4

    # fade in if opacity is under target
    s.opacity += 8.0 / @delta if s.opacity < @shine_opacity

    # rotate slowly if screensize < 2
    s.angle += 2.0 / @delta if $PokemonSystem.screensize < 2

    # breathing zoom effect
    s.zoom_x -= 0.01 * s.toggle / @delta
    s.zoom_y -= 0.01 * s.toggle / @delta
    s.toggle *= -1 if s.zoom_x <= 0.8 * @scale || s.zoom_x >= 1.2 * @scale
  end

  def disposed?
    @disposed
  end

  def dispose
    @disposed = true
    pbDisposeSpriteHash(@sprites)
  end
end