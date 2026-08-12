MUSIC_NAMES = ["dungeon0","dungeon1","dungeon2","dungeon3","dungeon4","dungeon5","dungeon6","dungeon7","dungeon8","dungeon9","dungeon10","dungeon11","dungeon12"]

TILESETS_TEMPLATES_BATTLEBACK = {
  1 => [14, "dungeon0", "Forest_0", "dungeon0"], # done
  2 => [14, "dungeon1", "Forest_1", "dungeon1"], # done
  3 => [14, "dungeon2", "Forest_2", "dungeon2"], # done
  4 => [11, "dungeon3", "Tulipanes", "dungeon3"], # done
  5 => [14, "dungeon4", "Temple_0", "dungeon4"], # done
  6 => [14, "dungeon5", "Temple_1", "dungeon5"], # done
  7 => [14, "dungeon6", "Temple_2", "dungeon6"], # done
  8 => [14, "dungeon7", "Cave_0", "dungeon7"], # done
  9 => [14, "dungeon8", "Cave_1", "dungeon8"], # done
  10 => [14, "dungeon9", "Cave_2", "dungeon9"], # done
  11 => [14, "dungeon10", "Desert", "dungeon10"], # done
  12 => [12, "dungeon11", "Beach", "dungeon11"], # done
  13 => [13, "dungeon12", "Estelar", "dungeon12"], # done
  }

REPETABLE_TILESETS = [5, 6, 7]

def changeStarterRoom
    room = REPETABLE_TILESETS.sample
    changeMapTileset(room, 2)
end

def pickNextBoss
  setItemsFloor # set shop items
  trainer_index = ($PokemonGlobal.dungeonFloor - 1) / 10

  trainer_const =
    if trainer_index <= 7
      Object.const_get("TRAINER_#{trainer_index}")
    else
      CHAMPION
    end

  $PokemonGlobal.dungeonNextRival = trainer_const.keys.sample
  $PokemonGlobal.dungeonNextBoss = [generate_single_encounter_species($PokemonGlobal.dungeonFloor), rand(100) == 0, 1 + rand(PokemonColorVariants::MAX_ANGLE - 2)]
end

def makeDungeonChanges
  $PokemonGlobal.dungeonFloor += 1
  changeFloorThings
  setDungeonEncounters
  echoln "Reached floor #{$PokemonGlobal.dungeonFloor}"
end

def isFinalRoom?
  $PokemonGlobal.dungeonFloor >= 100
end

def isBossRoom?
  $PokemonGlobal.dungeonFloor % 10 == 5
end

def isBattleRoom?
  $PokemonGlobal.dungeonFloor % 10 == 0
end

def changeFloorThings(force = false)

  if $PokemonGlobal.dungeonFloor % 10 == 0 # respite areas
    floor = $PokemonGlobal.dungeonFloor
    if floor >= 5 && floor <= 30
      bgmname = "mystery0"
    elsif floor >= 40 && floor <= 70
      bgmname = "mystery1"
    else
      bgmname = "mystery2"
    end
    changeMapBgm(3, bgmname)
    changeMapBgm(5, bgmname)
    changeMapBgm(6, bgmname)
  end

  return unless force || [1, 6].include?($PokemonGlobal.dungeonFloor % 10)
  # ==========================

  tileset = tileset_for_floor($PokemonGlobal.dungeonFloor)
  echoln $PokemonGlobal.pickGameFloors
  echoln "changing tileset to: #{tileset}"
  changeMapTileset(tileset,3)
  # ==========================
  changeMapTileset(tileset, 5) # respite tileset and boss (limited)
  changeMapTileset(tileset, 6)
  # ==========================
  changeMapRespite(TILESETS_TEMPLATES_BATTLEBACK[tileset][0]) #it'll do this always, its giving me headache. changes layout
  # ==========================

  # return if $PokemonGlobal.dungeonFloor % 10 == 0 #its respite area

  bgmname = TILESETS_TEMPLATES_BATTLEBACK[tileset][3]
  bgmname = "dungeonFinal" if $PokemonGlobal.dungeonFloor > 90
  changeMapBgm(3,bgmname)
  # changeMapBgm(5,bgmname)
  # changeMapBgm(6,bgmname) # unneeded?

  # pbBGMPlay(bgmname)
  # ==========================

end

def prepareBattleBoss
  if $game_map
    $game_map.events.each_value do |event|
      if event.name[/BossEvent/i]
        if isBattleRoom?
          pick = $PokemonGlobal.dungeonNextRival
          event.character_name = "trainer_#{pick.to_s}"
        elsif isBossRoom?
          bossSpecies = $PokemonGlobal.dungeonNextBoss[0]
          fname = ow_sprite_filename(event.x, event.y, bossSpecies.to_s)
          fname.gsub!("Graphics/Characters/","")
          event.character_name = fname
          event.character_hue = $PokemonGlobal.dungeonNextBoss[2] if $PokemonGlobal.dungeonNextBoss[1]
          pbMoveRoute(event, [PBMoveRoute::STEP_ANIME_ON])
        end
      end
    end
    $game_map.need_refresh = true
  end
end

def startBattleBoss
  if isBattleRoom?
    pick = $PokemonGlobal.dungeonNextRival
    pbRandomTeamGenerator(pick)
  elsif isBossRoom?
    bossSpecies = $PokemonGlobal.dungeonNextBoss[0]
    setBattleRule("midbattleScript", :raid_catch)
    setBattleRule("databoxStyle", :Long)
    setBattleRule("editWildPokemon", {
    :hp_level => 6,
    :immunities => [:OHKO, :ITEMREMOVAL, :ABILITYREMOVAL, :PPLOSS, :ALLSTATUS, :TRANSFORM, :INDIRECT]
    })
    pkmn = Pokemon.new(bossSpecies, getLevelCap - 3)
    [:HP, :ATTACK, :DEFENSE, :SPECIAL_ATTACK, :SPECIAL_DEFENSE, :SPEED].each do |stat|
      pkmn.iv[stat] = 31
    end
    pkmn.instance_variable_set(:@immunities, [
      :OHKO, :ITEMREMOVAL, :ABILITYREMOVAL, :PPLOSS, :ALLSTATUS, :TRANSFORM, :INDIRECT
    ])
    pkmn.shiny = $PokemonGlobal.dungeonNextBoss[1]
    pkmn.hue = $PokemonGlobal.dungeonNextBoss[2] if pkmn.shiny?
    setBattleRule("cannotRun")
    setBattleRule("disablePokeBalls")
    setBattleRule("raidstylecapture", pkmn)
    WildBattle.start(pkmn)
  end
end

def setDungeonEncounters
  encounter = $PokemonGlobal.dungeonFloor < 1 ? 1 : $PokemonGlobal.dungeonFloor # lazy
  $PokemonGlobal.dungeonEncounters = generate_encounters(encounter)
end

class PokemonGlobalMetadata
  attr_accessor :dungeonFloor
  attr_accessor :dungeonNextRival
  attr_accessor :dungeonNextBoss
  attr_accessor :dungeonEncounters
  attr_accessor :pickGameFloors
  attr_accessor :pickGameFloorEvents

  def dungeonEncounters
    return @dungeonEncounters || nil
  end

  def dungeonNextRival
    return @dungeonNextRival || []
  end

  def dungeonNextBoss
    return @dungeonNextBoss || nil
  end

  def dungeonFloor
    return @dungeonFloor || 0
  end

  def pickGameFloors
    @pickGameFloors ||= {}
    return @pickGameFloors
  end

  def pickGameFloorEvents
    @pickGameFloorEvents ||= {}
    return @pickGameFloorEvents
  end

end

def initialize_floor_tilesets(total_blocks = 20)
  $PokemonGlobal.pickGameFloors ||= {}
  return if $PokemonGlobal.pickGameFloors.length >= total_blocks

  tileset_ids = TILESETS_TEMPLATES_BATTLEBACK.keys
  current_count = $PokemonGlobal.pickGameFloors.length
  remaining_blocks = total_blocks - current_count

  needed_tilesets = tileset_ids.shuffle.cycle.take(remaining_blocks)

  (1..total_blocks).each do |block|
    next if $PokemonGlobal.pickGameFloors.key?(block)
    $PokemonGlobal.pickGameFloors[block] = needed_tilesets.shift
  end
  echoln "tilesets assigned: #{$PokemonGlobal.pickGameFloors}"
end

def initialize_floors_special_dialogue
  arcy_dialogues = $PokemonGlobal.respiteDialogue.shuffle
  if arcy_dialogues.first == :dialogue8 # arcy can't talk to you about his balls if you don't have the item
    swap_index = rand(1...arcy_dialogues.length) 
    arcy_dialogues[0], arcy_dialogues[swap_index] = arcy_dialogues[swap_index], arcy_dialogues[0]
  end

  shop_dialogues = $PokemonGlobal.shopDialogue.dup

  assigned_dialogues = {}

  (10..100).step(10).each_with_index do |floor, index|
    arcy = arcy_dialogues[index]
    shop = shop_dialogues[index]
    assigned_dialogues[floor] = [arcy, shop]
  end

  $PokemonGlobal.assignDialogueEvents = assigned_dialogues

  echoln "Dialogue events assigned: #{$PokemonGlobal.assignDialogueEvents.inspect}"
end

def initialize_floors_special_events(count = 5)
  event_species = $PokemonGlobal.dungeonPokeEvents.dup.shuffle   # <-- shuffle the species
  assigned_floors = {}

  event_species.each_with_index do |species, index|
    floor_start = index * count + 1
    floor_end = [floor_start + count - 1, 99].min  # Cap at 99

    valid_floors = (floor_start..floor_end).to_a.reject { |n| n % 5 == 0 }

    if valid_floors.empty?
      fallback_range = (1..99).to_a.reject { |n| n % 5 == 0 }
      assigned_floors[species] = fallback_range.sample
    else
      assigned_floors[species] = valid_floors.sample
    end
  end

  $PokemonGlobal.pickGameFloorEvents = assigned_floors

  echoln "events assigned: #{$PokemonGlobal.pickGameFloorEvents.inspect}"
end

def tileset_for_floor(floor)
  $PokemonGlobal.pickGameFloors ||= {}
  mapping = $PokemonGlobal.pickGameFloors

  tileset_ids = TILESETS_TEMPLATES_BATTLEBACK.keys
  block = ([floor, 1].max - 1) / 5 + 1  # ensures block is at least 1

  unless mapping.key?(block)
    mapping[block] = tileset_ids.sample
  end

  return mapping[block]
end

def changeMapTileset(tileset_id,map_id)
    map=load_data(sprintf("Data/Map%03d.%s", map_id, $RPGVX ? "rvdata" : "rxdata"))
    map.tileset_id = tileset_id
    save_data(map, sprintf("Data/Map%03d.%s", map_id,$RPGVX ? "rvdata" : "rxdata"))
end

def changeMapBgm(map_id,bgmname)
    map=load_data(sprintf("Data/Map%03d.%s", map_id,$RPGVX ? "rvdata" : "rxdata"))
    map.bgm.name=bgmname
    save_data(map, sprintf("Data/Map%03d.%s", map_id,$RPGVX ? "rvdata" : "rxdata"))
end

WATERSTARTER = [:SQUIRTLE, :TOTODILE, :MUDKIP, :PIPLUP, :OSHAWOTT, :FROAKIE, :POPPLIO, :SOBBLE, :QUAXLY]
FIRESTARTER  = [:CHARMANDER, :CYNDAQUIL, :TORCHIC, :CHIMCHAR, :TEPIG, :FENNEKIN, :LITTEN, :SCORBUNNY, :FUECOCO]
GRASSSTARTER = [:BULBASAUR, :CHIKORITA, :TREECKO, :TURTWIG, :SNIVY, :CHESPIN, :ROWLET, :GROOKEY, :SPRIGATITO]

class PokemonGlobalMetadata
    attr_accessor :getStarter

    def getStarter
      return @getStarter || [[:PIKACHU, true, 0], [:PIKACHU, true, 0], [:PIKACHU, true, 0]]
    end
end

def setNewStarters
  $PokemonGlobal.getStarter = [
    [WATERSTARTER.sample, rand(100) == 0, 1 + rand(PokemonColorVariants::MAX_ANGLE - 2)],
    [FIRESTARTER.sample,  rand(100) == 0, 1 + rand(PokemonColorVariants::MAX_ANGLE - 2)],
    [GRASSSTARTER.sample, rand(100) == 0, 1 + rand(PokemonColorVariants::MAX_ANGLE - 2)]
  ].shuffle
end

def askPokeStarter(num)
    pkmn = Pokemon.new($PokemonGlobal.getStarter[num][0], 5)
    pkmn.shiny = $PokemonGlobal.getStarter[num][1]
    pkmn.hue = $PokemonGlobal.getStarter[num][2] if pkmn.shiny?
    ShowStarterPokemon.new(pkmn)
    Mugshot.load("Arcy")
    if pbConfirmMessage(_INTL("\\tg[Arceus]Will you pick {1}?", GameData::Species.get(pkmn.species).name))
        Mugshot.dispose
        pbAddPokemon(pkmn)
        return true
    else
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]We have all the time in the world..."))
        Mugshot.dispose
        return false
    end
end

EventHandlers.add(:on_player_step_taken, :countArcySteps,
  proc { 
    next unless $game_map.map_id == 3 && !$game_switches[60]
    echoln "Counting steps"
    $game_variables[27] ||= 0
    $game_variables[27] += 1
    if $game_variables[27] == 5
      pbCommonEvent(4)
    end
  }
)

EventHandlers.add(:on_player_step_taken, :arcyStepSound,
  proc { 
    next unless $PokemonGlobal.surfing && $PokemonGlobal.stepcount.even?
    echoln "arceus sound"
    pbSEPlay("NEWArceusStep")
  }
)