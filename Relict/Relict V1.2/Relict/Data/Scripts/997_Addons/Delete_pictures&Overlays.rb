DARK_MAP_TILESETS = ["dungeon4", "dungeon5", "dungeon6", "dungeon7", "dungeon8", "dungeon9"]
LIGHT_TILESETS= ["dungeon0", "dungeon1", "dungeon2", "dungeon4", "dungeon5", "dungeon6", "dungeon7", "dungeon8", "dungeon10", "dungeon11"]
HAS_FOREST_FOG = ["dungeon0", "dungeon1", "dungeon2"]
RESPITE_MAP = [5, 6]

EventHandlers.add(:on_map_or_spriteset_change, :erase_pictures_and_fogs,
  proc { |scene, _map_changed|
    next if !scene || !scene.spriteset
    next if $game_map.map_id == 7
    if HAS_FOREST_FOG.include?($game_map.tileset_name)
      $game_map.fog_name = "forest"
      $game_map.fog_opacity = 60
    else
      $game_map.fog_name = ""
    end
    if $game_map.tileset_name == "dungeon12"
      $game_map.panorama_name = "Nebula"
    else
      $game_map.panorama_name = ""
    end
    $game_screen.pictures.each { |picture| picture&.erase }
    $game_screen.pictures[1].show("Darkness",0,0,0,100,100,255,0) if DARK_MAP_TILESETS.include?($game_map.tileset_name)
    $game_screen.pictures[2].show("Sunlight",0,0,0,100,100,60,1) if LIGHT_TILESETS.include?($game_map.tileset_name)  }
)

def changeMapRespite(map_id = 0)
  basemap = load_data(sprintf("Data/Map%03d.rxdata", map_id))

  [5, 6].each do |target_id|
    map = load_data(sprintf("Data/Map%03d.rxdata", target_id))
    for y in 0...map.height
      for x in 0...map.width
        for z in 0..2
          map.data[x, y, z] = basemap.data[x, y, z]
        end
      end
    end
    save_data(map, sprintf("Data/Map%03d.rxdata", target_id))
    $map_factory.setup(target_id)
    $map_factory.setMapChanged(target_id)
  end
end

def load_data(fname)
    File.open(fname, 'rb') do |f|
        data = Marshal.load(f)
        return data
    end
end
  
def save_data(data, fname)
    File.open(fname, 'wb') do |f|
        Marshal.dump(data, f)
    end
end