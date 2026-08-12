class PokemonGlobalMetadata
  attr_accessor :dungeonPokeEvents

  def dungeonPokeEvents
    return @dungeonPokeEvents ||=
    [
      :MAGIKARP,
      :JIGGLYPUFF,
      :DIGLETT,
      :SUDOWOODO,
      :DELIBIRD,
      :UNOWN_8,
      :SLOWKING_1,
      :SWABLU,
      :APPLIN,
      :BEWEAR,
      :SPRITZEE,
      :KLEFKI,
      :TINKATON,
      :PSYDUCK,
      :MIMIKYU,
      :CHANSEY,
      :EEVEE,
      :CASTFORM,
      :DRACOVISH,
      :RELICANTH,
      :MINIOR,
      :MALAMAR,

      #new
      :SNUBBULL,
      :POIPOLE,
      :WOBBUFFET,
      :OVERQWIL,
      :EISCUE,
      :VOLTORB,
      :MUK,
      :GARGANACL,
      :KINGAMBIT,
      :GLISCOR,
      :GARCHOMP,
      :SINISTCHA,
      :SCOVILLAIN,
      :FALINKS,
      :SPHEAL,
      :SPINDA,
      :DRAMPA,
      :DARUMAKA,
      :BANETTE,
      :MUSHARNA

    ]
  end
end

def createPokemonEventsDungeon(complexity, current_map, new_map_id)
  return if $player.able_pokemon_count == 0
  return if !$game_map.metadata&.has_flag?("dungeonDisplay")
  healingItem = false
  pokeballItem = false

  poke_event_id = 1
  item_event_id = 2
  money_event_id = 3

  eventArray = [nil, nil, nil] # pokemon events, item events, coin events
  case complexity
  when 1
    eventArray = [1, [2, 3].sample, 1]
  when 2
    eventArray = [1, [3, 4].sample, [1, 2].sample]
  when 3
   eventArray = [1, [4, 5].sample, [1, 2].sample]
  when 4
   eventArray = [1, [5, 6].sample, 2]
  end
  new_map = load_data(sprintf("Data/Map%03d.rxdata", new_map_id))

  floor = $PokemonGlobal.dungeonFloor.clone
  species = $PokemonGlobal.pickGameFloorEvents.key(floor)

  eventArray[0].times do
    next if !$PokemonGlobal.dungeonPokeEvents.include?(species)
    next if $PokemonGlobal.dungeonPokeEvents.empty?
    next if !species

    new_event = new_map.events[poke_event_id]
    new_event = Marshal.load(Marshal.dump(new_event))

    echoln species

    new_id = current_map.events.keys.max.to_i + 1
    new_event.instance_variable_set(:@id, new_id)
    new_event.name += "_copy#{new_id}_#{species}"
    
    fname = ow_sprite_filename(new_event.x, new_event.y, species.to_s)
    fname.gsub!("Graphics/Characters/","")
    new_event.pages[0].graphic.character_name = fname

    current_map.events[new_id] = new_event
  end

  # items
  eventArray[1].times do
    new_event = new_map.events[item_event_id]
    new_event = Marshal.load(Marshal.dump(new_event))
    
    if !pokeballItem || !healingItem
      item = rand(4) <= 1 ? getSampleItem($items_balls) : getSampleItem($items_healing)
    else
      others = [$items_hold, $items_TM, $items_berries, $items_evolution, $items_gems, $items_battle_use, $items_megastones]
      item = getSampleItem(others.sample)
    end

    itemName = item
    item = GameData::Item.get(item)
    pokeballItem = true if item.is_poke_ball?
    healingItem = true if item.pocket == 2

    new_id = current_map.events.keys.max.to_i + 1
    new_event.instance_variable_set(:@id, new_id)
    new_event.name += "_copy#{new_id}_#{itemName}"
    
    if item.is_poke_ball?
      fname = "item_ball"
    elsif item.is_machine?
      fname = "item_tm"
    elsif item.is_berry?
      fname = "item_berry"
    elsif item.pocket == 2
      fname = "item_potion"
    else
      fname = "item_usual"
    end

    new_event.pages[0].graphic.character_name = fname

    current_map.events[new_id] = new_event
  end

  # money
  eventArray[2].times do
    new_event = new_map.events[money_event_id]
    new_event = Marshal.load(Marshal.dump(new_event))
    
    gold = 80 + floor * 10 + rand(0..floor * 5) 
    new_id = current_map.events.keys.max.to_i + 1
    new_event.instance_variable_set(:@id, new_id)
    new_event.name += "_copy#{new_id}_GOLD_#{gold}"

    fname = "item_gold"
    new_event.pages[0].graphic.character_name = fname

    current_map.events[new_id] = new_event
  end

end

def getGoldDungeonEvent
  name = $game_map.events[@event_id].name
  match = name.match(/_GOLD_(\d+)/)
  if match
    quantity = match[1].to_i
    $player.money += quantity
    echoln "Gained #{quantity} gold"
  else
    quantity = 0
    echoln "No gold amount found"
  end
  itemGoldAnim(quantity)
  $player.money += quantity
  $game_map.events[@event_id].character_name = ""
  refreshEventsDungeonLayout
end

def itemGoldAnim(qty)
  bitmap = Bitmap.new("Graphics/Pictures/Object")
  pbSetSystemFont(bitmap)
  base = Color.new(248, 248, 248)
  shadow = Color.new(72, 80, 88)
  textpos = [[_INTL("Gold x{1}", qty), 5, 15, false, base, shadow]]
  pbDrawTextPositions(bitmap,textpos)
  bitmap.blt(274,5,Bitmap.new("Graphics/Pictures/GoldPic"),Rect.new(0,0,48,48))
  pbSEPlay(FAST_ITEM_GET_SE)
  $scene.addSprite(-bitmap.width, 200, bitmap)
end

def getItemDungeonEvent
  name = $game_map.events[@event_id].name
  item_symbol = name.split("_").last.to_sym
  item = GameData::Item.get(item_symbol)
  quantity = item.is_poke_ball? ? rand(2) + 1 : 1
  pbItemBall(item, quantity)
  $game_map.events[@event_id].character_name = ""
  refreshEventsDungeonLayout
end

def pokeBattleEvent(species)
    if !$game_switches[32]
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Looks like this will be a tough battle."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]If you encounter any Pokémon that may pose a fierce battle but you don't feel ready yet, feel free to leave them as-is and come back later."))
      Mugshot.dispose
      $game_switches[32] = true
    end
    Mugshot.load("Arcy")
    choice = pbMessage(_INTL("\\tg[Arceus]How will you proceed?"), [
      _INTL("I need to check what that item is."),
      _INTL("It's not worth the risk."),
    ], -1)
    Mugshot.dispose

    return false if choice != 0
    bossSpecies = species
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
    pkmn.shiny = false
    setBattleRule("cannotRun")
    setBattleRule("disablePokeBalls")
    WildBattle.start(pkmn)
    return false if $game_variables[1] == 2 # you lost idiot

    # you won

    others = [$items_TM, $items_evolution, $items_megastones]
    item = getSampleItem(others.sample)
    pbReceiveItem(item)

    $PokemonGlobal.dungeonPokeEvents.delete(species)
    $game_map.events[@event_id].character_name = ""
    refreshEventsDungeonLayout

    Mugshot.load("ArcyShrug")
    pbMessage(_INTL("\\tg[Arceus]...So? Was it worth it?"))
    Mugshot.dispose

    return true
end

# snubbull DONE TESTED
# poipole DONE TESTED
# wobbuffett DONE TESTED
# overqwil DONE TESTED 
# eiscue DONE TESTED 
# voltorb DONE 
# muk DONE
# garganacl DONE
# kingambit DONE
# gliscor DONE
# garchomp DONE
# sinistcha DONE
# scovillain DONE
# falinks DONE
# Spheal DONE
# Spinda DONE
# drampa done
# darumaka DONE
# banette DONE
# musharna DONE

def dialoguePokeEvent
  name = $game_map.events[@event_id].name
  species = name.split("_").last.to_sym
  GameData::Species.play_cry_from_species(species)
  dialogue_map = {
    "MUSHARNA" => proc {
      pbMessage(_INTL("\\tg[Musharna]Zzz..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Musharna are always drowsy and sleeping, with quite the bad temper when woken up."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]The mist emanating from its forehead is packed with the dreams of people and Pokémon."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]It can even change colors depending on the dreams it has eaten."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]However, it's best to keep your distance if it turns black."), [
        _INTL("Is it poisonous?")
      ], -1)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Not poisonous, but it will make your nightmares reality."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]I wonder what would it show me..."))
      Mugshot.dispose
      pbMessage(_INTL("\\tg[Arceus]Musharna floated away, leaving something behind."))
    },
    "BANETTE" => proc {
      pbMessage(_INTL("\\tg[Banette]Nette..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]The origins of Banette are quite tragic."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]An abandoned plush doll turning into a Pokémon out of hatred for being thrown away."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]It generates energy for laying strong curses by sticking pins into its body."))
      Mugshot.load("ArcyShrugA")
      choice = pbMessage(_INTL("\\tg[Arceus]It tirelessly seeks the child who disowned it to exact its revenge."), [
        _INTL("Is there no way to help it?")
      ], -1)
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]There are stories of Banette turning back into its original form if you treat it well."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]So, you should probably be careful with your belongings..."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]Who knows if one day one of them will come to life and chase after you?"))
      Mugshot.dispose
      pbMessage(_INTL("Banette disappeared, leaving something behind."))
    },
    "DARUMAKA" => proc {
      pbMessage(_INTL("\\tg[Darumaka]Zzz..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]A sleeping Darumaka, it means the fire inside it has diminished."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Even like this, it's impossible to make it fall over."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]I believe it's considered a symbol of good fortune because of it."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]Oh, look, a dropping. You should pick it up."), [
        _INTL("What? Why would I do that!?")
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Don't look at me like that, people have used Darumaka droppings to keep themselves warm for a long time."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]I'm merely looking out for you."))
      Mugshot.dispose
      pbMessage(_INTL("Darumaka woke up and ran away, leaving something behind."))
    },
    "DRAMPA" => proc {
      pbMessage(_INTL("\\tg[Drampa]Dram..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Ah, this one is quite gentle despite its size."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Drampa likes to play with children, I believe hearing that it's a favorite among the mothers."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]However, it can be quite overprotective of the children it likes..."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]Drampa will burn down the house of whoever bothered them."), [
        _INTL("Isn't that a bit much?")
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Not really. It is a very compassionate Pokémon, only fools would be able to awaken its wrath."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]For bullying a defenseless child, perhaps it's seen as an act of justice?"))
      Mugshot.dispose
      pbMessage(_INTL("Drampa flew away, leaving something behind."))
    },
    "SPINDA" => proc {
      pbMessage(_INTL("\\tg[Spinda]Spin..."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]The shaky steps of a Spinda can confuse its opponent, so you shouldn't stare at it too much."))
      Mugshot.load("ArcyShrugA")
      pbMessage(_INTL("\\tg[Arceus]It may look like it's dancing, and yet it believes to be walking in a straight line..."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]However, the real highlight of this Pokémon is its pattern."))
      Mugshot.load("Arcy")
      choice = pbMessage(_INTL("\\tg[Arceus]The chances of finding two identical Spinda is less than one in four billion."), [
        _INTL("...That sounds like an awful lot of work for you.")
      ], -1)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Maybe, but I was bored. Not to mention that there are people who like to collect them."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]Hahaha... I wonder if one day someone will be able to gather all of them."))
      Mugshot.dispose
      pbMessage(_INTL("Spinda tottered away, leaving something behind."))
    },
    "SPHEAL" => proc {
      pbMessage(_INTL("\\tg[Spheal]Pheal!"))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Spheal are quite the nosy bunch, clapping to show their satisfaction with the food."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]You have to be quite careful with them..."))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]Else, it might end up rolling down a mountain."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]Its body is poorly shaped for swimming, so they cross the ocean by rolling on ice."), [
        _INTL("Why did you make its body like that, then?")
      ], -1)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]It would be boring if all Pokémon could just swim their way across the sea."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]I gave them a more amusing way to travel, aren't I kind?"))
      Mugshot.dispose
      pbMessage(_INTL("Spheal rolled away, leaving something behind."))
    },
    "FALINKS" => proc {
      pbMessage(_INTL("\\tg[Falinks]Fa! Links!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon depends on teamwork, the leader is called the brass."))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]Surprisingly, it won't fight the one in command, the brass' orders are absolute."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]To be the one in charge of everything, and having no one to question it..."))
      Mugshot.load("ArcySmile")
      choice = pbMessage(_INTL("\\tg[Arceus]Seems like a dream for many, doesn't it?"), [
        _INTL("Why do they count as a single Pokémon if there are six of them...?")
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Because I wanted it to."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]...And because they work together as such, it would be more confusing to try and differentiate all of them."))
      Mugshot.dispose
      pbMessage(_INTL("Falinks marched away, leaving something behind."))
    },
    "GARGANACL" => proc {
      pbMessage(_INTL("\\tg[Garganacl]Gar?"))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Now, this one is a favorite of many Pokémon due to its mineral-rich salt."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Both sturdy and tasty, given how many try to lick it."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Despite its size, it sprinkles salt on other Pokémon's injuries to heal them."))
      Mugshot.load("ArcyThinkA")
      choice = pbMessage(_INTL("\\tg[Arceus]Quite the gentle giant, isn't it?"), [
        _INTL("Tasty...? Does that mean you've licked it too?")
      ], -1)
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]I created it."), [
        _INTL("That doesn't answer the question...")
      ], -1)
      Mugshot.dispose
      pbMessage(_INTL("Garganacl walked off, leaving something behind."))
    },
    "POIPOLE" => proc {
      pbMessage(_INTL("\\tg[Poipole]Poi..."))
      Mugshot.load("ArcySurprise")
      pbMessage(_INTL("\\tg[Arceus]...What a rare sight this is."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This creature should not be here."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]I wonder how it could have found its way to this dimension by itself..."))
      Mugshot.load("ArcySmile")
      choice = pbMessage(_INTL("\\tg[Arceus]Maybe we should bring it along."), [
        _INTL("Hey, look out!")
      ], -1)
      pbWait(0.2)
      pbSEPlay("NEWStringShot")
      pbWait(0.8)
      Mugshot.load("ArcyMuc")
      pbMessage(_INTL("\\tg[Arceus]Hahaha... I will keep that warning shot in mind."))
      Mugshot.dispose
      pbMessage(_INTL("Poipole floated away, leaving something behind."))
    },
    "SNUBBULL" => proc {
      pbMessage(_INTL("\\tg[Snubbull]Sniff..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Ah, such a pitiful creature."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Despite being kind and affectionate, its frightening face scares off other Pokémon."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]No wonder this one is in such a low mood."))
      Mugshot.load("ArcySmile")
      choice = pbMessage(_INTL("\\tg[Arceus]You should pet it. They're actually quite friendly."), [
        _INTL("It won't bite me?")
      ], -1)
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Now, you really think I would tell you to pet a dangerous Pokémon?"))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]Hahaha... Your silence is quite expressive."))
      Mugshot.dispose
      pbMessage(_INTL("Snubbull scampered off, leaving something behind."))
    },
    "SCOVILLAIN" => proc {
      pbMessage(_INTL("\\tg[Scovillain]Sco!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Many people say that two heads think better than one."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]...I am unsure if that is true for this specific Pokémon, it won't stop once it goes on a rampage."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Although, it seems to be holding something between its leaves..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "SINISTCHA" => proc {
      pbMessage(_INTL("\\tg[Sinistcha]..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]A totally unamusing cup of tea, a very common find in this tower."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]...I am joking, of course. It's actually a Pokémon hoping to drain your life-force."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]There seems to be something inside the teacup, however..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "GARCHOMP" => proc {
      pbMessage(_INTL("\\tg[Garchomp]Chomp!"))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Quite the dangerous Pokémon, it is said to create blades of wind when it runs at high speed."))
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]Many people also like to make jokes about a Garchomp and a piano..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]I don't see any pianos, but it seems to be holding something interesting in its mouth."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "GLISCOR" => proc {
      pbMessage(_INTL("\\tg[Gliscor]Cor..."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Quite a rare sight to see this Pokémon on the ground."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]It usually glides all around, so soundlessly that it would be too late by the time you feel its gaze."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]It seems to have chosen an interesting item as its prey..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "KINGAMBIT" => proc {
      pbMessage(_INTL("\\tg[Kingambit]Gambit..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This one is quite ferocious, isn't it?"))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]A Bisharp that proved to be the strongest amongst its kin, pushing through with brute strength."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]It seems to be guarding something..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "MUK" => proc {
      pbMessage(_INTL("\\tg[Muk]Muk..."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]Hahaha... You're quite wise to keep your distance."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon is made out of a very strong, smelly poison. It can even leave the ground barren for years."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]There seems to be something stuck in its body, however..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "VOLTORB" => proc {
      pbMessage(_INTL("\\tg[Voltorb]..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]This may seem like a Poké Ball, but it's actually a Pokémon."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]It is known to self-destruct with very little stimuli, even a small bump."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]However, it seems to be laying on top of an item. Remember that you can't die here..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "EISCUE" => proc {
      pbMessage(_INTL("\\tg[Eiscue]Cue..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Ah, this Pokémon is quite sensitive to heat, so it tries to keep its head cold at all times."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]There seems to be something interesting trapped in the ice."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]It won't let you acquire it without a fight..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "OVERQWIL" => proc {
      pbMessage(_INTL("\\tg[Overqwil]Zzz..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Looks like this Pokémon fell asleep with an item latched onto its spikes."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]It has a very short temper... I believe it can stab anyone who gets close even in its sleep."))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]It's extremely poisonous but, as you know, you can't die in this place..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "WOBBUFFET" => proc {
      pbMessage(_INTL("\\tg[Wobbuffet]Wobbuffet..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon seems to be sitting on something."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]It might be an interesting item that could help you in this journey."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]However, it will attack if you get close to its tail..."))
      Mugshot.dispose
      return pokeBattleEvent(species)
    },
    "MALAMAR" => proc {
      pbMessage(_INTL("\\tg[Malamar]Mal..."))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus]Beware of this Pokémon. It can..."), [
        _INTL("My... friend..."),
        _INTL("Malamar... my friend Malamar..."),
      ], -1)
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]...Alright. Feel free to enjoy your new friend's company."))
      pbMessage(_INTL("Malamar vanished into the shadows, leaving something behind... You're not quite sure what just happened."))
      Mugshot.dispose
    },
    "MAGIKARP" => proc {
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]...Is that Magikarp looking for the staircase?"))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]I admire the persistence. Even if it's... spectacularly pointless."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]...I'm not helping it."))
      Mugshot.dispose
      pbMessage(_INTL("The Magikarp flopped away awkwardly, leaving something behind."))
    },
    "JIGGLYPUFF" => proc {
      pbMessage(_INTL("\\tg[Jigglypuff]Jiggly... puff..."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]And so it begins."))
      Mugshot.load("ArcyShrugA")
      choice = pbMessage(_INTL("\\tg[Arceus]I do hope your willpower is stronger than average. Mine, of course, is beyond such mortal..."), [
        _INTL("Zzzz..."),
      ], -1)
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]Ah. You're already asleep."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]Hahahaha... It's scribbling on your face. How adorable. "))
      Mugshot.dispose
      pbMessage(_INTL("Jigglypuff bounced away, dropping something behind."))
    },
    "DIGLETT" => proc {
      pbMessage(_INTL("\\tg[Diglett]Dig..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Ah, yes. This creature only shows a fraction of itself above ground."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]I've seen what lies beneath, of course. I created it, after all."))
      Mugshot.dispose
      pbMessage(_INTL("\\tg[Diglett]Glett..."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]And no, I won't tell you. That's your burden to uncover."))
      Mugshot.dispose
      pbMessage(_INTL("Diglett burrowed away, leaving something behind."))
    },
    "SUDOWOODO" => proc {
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]...You're not a tree."))
      Mugshot.dispose
      pbMessage(_INTL("\\tg[Sudowoodo]Doo?"))
      Mugshot.load("ArcyThink")
      choice = pbMessage(_INTL("\\tg[Arceus]You cannot deceive me. I designed you both and actual trees..."), [
        _INTL("Don't be so mean..."),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]...Still not a tree."))
      Mugshot.dispose
      pbMessage(_INTL("Sudowoodo left something behind as it walked away."))
    },
    "DELIBIRD" => proc {
      pbMessage(_INTL("\\tg[Delibird]Deli!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Oh... A gift, I presume?"))
      Mugshot.dispose
      pbWait(0.2)
      $scene.spriteset.addUserAnimation(15, $game_player.x, $game_player.y - 1, true)
      pbWait(0.8)
      Mugshot.load("ArcyFire")
      choice = pbMessage(_INTL("\\tg[Arceus](...)"), [
        _INTL("You look like a candle."),
      ], -1)
      Mugshot.load("ArcyFire")
      pbMessage(_INTL("\\tg[Arceus]I can't believe I still allow this nonsense to happen."))
      Mugshot.dispose
      pbMessage(_INTL("Delibird dropped something behind as it waddled away."))
    },
    "UNOWN" => proc {
      pbMessage(_INTL("\\tg[Unown]...I?"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Just one of them? That's unusual."))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]These Pokémon are supposed to appear in groups to form messages."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]...Or maybe it is a message. Like..."), [
        _INTL("\"Idiot\"?"),
        _INTL("\"Irresponsible\"?"),
        _INTL("\"Insufferable\"?"),
        _INTL("\"Insolent\"?"),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]How bold of you."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]...Though if true, I suppose I should be flattered that even wild symbols choose to insult me now."))
      Mugshot.dispose
      pbMessage(_INTL("Unown floated off mysteriously, leaving something behind."))
    },
    "SLOWKING" => proc {
      pbMessage(_INTL("\\tg[Slowking]Slooow..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Ah, this alchemist. Its crown thinks for it now."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]I see you've brought... potions? How quaint."), [
        _INTL("Here, you drink this."),
      ], -1)
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]...No, I must refus-ngh?"))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyShrug")
      choice = pbMessage(_INTL("\\tg[Arceus]What foul elixir hast thou bestowed upon mine divine throat?"), [
        _INTL("Is that the potion talking or you?")
      ], -1)
      Mugshot.load("ArcyShrugA")
      pbMessage(_INTL("\\tg[Arceus]Verily, I am immune to such feeble tinctures. I merely missed speaking thus."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]Art thou judging me now?"))
      Mugshot.dispose
      pbMessage(_INTL("Slowking wandered off, leaving something behind."))
    },
    "SWABLU" => proc {
      pbMessage(_INTL("\\tg[Swablu]Bluuu..."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]What is it, now?"))
      Mugshot.load("ArcySwablu")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcySwablu")
      choice = pbMessage(_INTL("\\tg[Arceus]I am the very source of all that doth exist. The primal cause that broughteth order to the vast expanse and fashion'd all creation with mine sovereign hand..."), [
        _INTL("And now, you have a fluffy cottoned hat."),
      ], -1)
      Mugshot.load("ArcySwablu")
      pbMessage(_INTL("\\tg[Arceus]Should mine hair be plucked, I fear much harm shall befall thee."))
      Mugshot.dispose
      pbMessage(_INTL("Swablu flew off leaving something behind."))
    },
    "APPLIN" => proc {
      pbMessage(_INTL("\\tg[Applin]Plin...!"))
      Mugshot.load("ArcyThink")
      choice = pbMessage(_INTL("\\tg[Arceus]In Galar, this Pokémon is considered a symbol of affection; a gift of love."), [
        _INTL("Maybe it's offering itself to you."),
      ], -1)
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]A bold gesture. I am worthy of worship, however..."))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]I wonder what it tastes like baked..."), [
        _INTL("Are you trying to eat the love symbol?")
      ], -1)
      Mugshot.load("ArcyShrug")
      choice = pbMessage(_INTL("\\tg[Arceus]I simply find the aroma... intriguing."), [
        _INTL("Does the horse god want pie?")
      ], -1)
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]Hush thee."))
      Mugshot.dispose
      pbMessage(_INTL("Applin rolled away leaving something behind."))
    },
    "BEWEAR" => proc {
      pbMessage(_INTL("\\tg[Bewear]Wear..."))
      Mugshot.load("ArcyThink")
      choice = pbMessage(_INTL("\\tg[Arceus]This one craves affection and longs for hugs... unaware of its own immense strength."), [
        _INTL("Will you give it a hug?"),
      ], -1)
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]...Well, I'd rather not become a pile of divine mulch."))
      Mugshot.load("ArcyYeah")
      choice = pbMessage(_INTL("\\tg[Arceus]And still, it comes closer, arms open, with no hesitation..."), [
        _INTL("Come on, show it some love."),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Thou first."))
      Mugshot.dispose
      pbMessage(_INTL("Bewear waddled off leaving something behind."))
    },
    "SPRITZEE" => proc {
      pbMessage(_INTL("\\tg[Spritzee]Zee...!"))
      Mugshot.load("ArcyThink")
      choice = pbMessage(_INTL("\\tg[Arceus]This Pokémon is perfume incarnate. Its aroma changes to suit the desires of the smeller."), [
        _INTL("What do you smell?"),
      ], -1)
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus](...)"))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus]Freshly baked bread."), [
        _INTL("I think you're just hungry."),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]Nonsense. You do not need to be hungry to appreciate the aroma of perfectly baked bread."))
      Mugshot.dispose
      pbMessage(_INTL("Spritzee twirled away, leaving something behind."))
    },
    "KLEFKI" => proc {
      pbMessage(_INTL("\\tg[Klefki]Ki! Klef...!"))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus](...)"), [
        _INTL("It's jingling its little keys... Cute."),
      ], -1)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]...That is a threat display."))
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]It shakes its keys at perceived foes to assert dominance."))
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]I understand exactly what it's saying, however..."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Perhaps it's best I don't translate."))
      Mugshot.dispose
      pbMessage(_INTL("Klefki rattled away, leaving something behind."))
    },
    "TINKATON" => proc {
      pbMessage(_INTL("\\tg[Tinkaton]Ton!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Oh, it handed you a piece of its hammer."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]Very charming... Until you realize that chunk once belonged to a Corviknight it knocked out of the sky."), [
        _INTL("But why...?"),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]People find their own ways of having fun, I suppose."))
      Mugshot.dispose
      pbMessage(_INTL("Tinkaton skipped away, leaving something behind."))
    },
    "PSYDUCK" => proc {
      pbMessage(_INTL("\\tg[Psyduck]Psy... duck..."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon suffers from a perpetual headache."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Naturally, it's not a flaw... it was intentional. I designed it that way."))
      Mugshot.load("Arcy")
      choice = pbMessage(_INTL("\\tg[Arceus]The pressure in its head builds until it unleashes energy beyond comprehension, though it never understands why."), [
        _INTL("You're the real headache here."),
      ], -1)
      Mugshot.load("ArcyShrug")
      pbMessage(_INTL("\\tg[Arceus]If you say so. But at least I'm not the one waddling around holding my head."))
      Mugshot.dispose
      pbMessage(_INTL("Psyduck stumbled away slowly, leaving something behind."))
    },
    "MIMIKYU" => proc {
      pbMessage(_INTL("\\tg[Mimikyu]Mii..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This creature is so desperate to be loved, it hides beneath a cloth pretending to be something it's not."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]No one has ever seen what lies beneath... not without consequence."))
      Mugshot.load("ArcySmile")
      choice = pbMessage(_INTL("\\tg[Arceus]If you're curious, now would be the time to peek. I could always revive you afterwards..."), [
        _INTL("No, thank you."),
      ], -1)
      Mugshot.load("ArcySmile")
      pbMessage(_INTL("\\tg[Arceus]Hahaha... What a shame. Watching you try might've made for some memorable entertainment."))
      Mugshot.dispose
      pbMessage(_INTL("Mimikyu quietly drifted away, leaving something behind."))
    },
    "CHANSEY" => proc {
      pbMessage(_INTL("\\tg[Chansey]Chan!"))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Chansey are always so willing to help, aren't they?"))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Even if you get hurt when chasing after them, they'll still come to your aid."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]I made them long ago when I still cared about the well-being of everyone above all else."))
      Mugshot.load("ArcyShrug")
      choice = pbMessage(_INTL("\\tg[Arceus]But now... that's just too boring, isn't it?"), [
        _INTL("...So you don't care about anyone anymore?"),
      ], -1)
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]Care leads to patterns, and patterns lead to predictability."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Meaning... nothing dulls faster than that."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Still... sometimes, I miss the simplicity of it."))
      Mugshot.dispose
      pbMessage(_INTL("Chansey turned and trotted off, leaving something behind."))
    },
    "EEVEE" => proc {
      pbMessage(_INTL("\\tg[Eevee]Vee!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Eevee is quite adaptable, able to shift and change depending on what surrounds it..."))
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]In that way, it's not so different from me, right?"))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus]Though it does so out of necessity, not choice."), [
        _INTL("If it's well taken care of, it can also choose."),
      ], -1)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Hmm, true."))
      Mugshot.load("ArcyDown")
      pbMessage(_INTL("\\tg[Arceus]Perhaps there's more freedom in its evolution than I initially thought."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]That's interesting, isn't it? The idea of evolution being a form of choice."))
      Mugshot.dispose
      pbMessage(_INTL("Eevee scampered off, leaving something behind."))
    },
    "CASTFORM" => proc {
      pbMessage(_INTL("\\tg[Castform]Cast!"))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]Castform is a creature that changes with the weather."))
      Mugshot.load("ArcyThinkA")
      choice = pbMessage(_INTL("\\tg[Arceus]Sun, rain, snow... I suppose you could say it mirrors the world itself."), [
        _INTL("Do you prefer sunny days or rainy ones?"),
      ], -1)
      Mugshot.load("ArcyThinkB")
      pbMessage(_INTL("\\tg[Arceus]Rainy days do have their appeal. However..."))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus]The reflections they create can lead to more connections to the Distortion World, where Giratina resides."), [
        _INTL("So, you prefer sunny days then?"),
      ], -1)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]That's correct."))
      Mugshot.dispose
      pbMessage(_INTL("Castform floated away, leaving something behind."))
    },
    "DRACOVISH" => proc {
      pbMessage(_INTL("\\tg[Dracovish]Draco..."))
      Mugshot.load("ArcyShrug")
      choice = pbMessage(_INTL("\\tg[Arceus]...I'm not responsible for this abomination."), [
        _INTL("Don't call it... that."),
      ], -1)
      Mugshot.load("ArcyShrugA")
      choice = pbMessage(_INTL("\\tg[Arceus]It's what happens when humans decide to mess up too much with my creations."), [
        _INTL("So for once, you're not behind this one's misery?"),
      ], -1)
      Mugshot.load("ArcyShrugB")
      pbMessage(_INTL("\\tg[Arceus]No. For once, I'm not."))
      Mugshot.dispose
      pbMessage(_INTL("Dracovish ran off, leaving something behind."))
    },
    "RELICANTH" => proc {
      pbMessage(_INTL("\\tg[Relicanth]Canth..."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon hasn't changed in the slightest since I created it 100 million years ago."))
      Mugshot.load("ArcyThinkB")
      choice = pbMessage(_INTL("\\tg[Arceus]Quite impressive, isn't it?"), [
        _INTL("Now that you mention it, you're quite old yourself, aren't you?"),
      ], -1)
      Mugshot.load("Arcy")
      choice = pbMessage(_INTL("\\tg[Arceus]Well, yes. I am the oldest being alive, after all."), [
        _INTL("You look quite decent for being that ancient."),
      ], -1)
      Mugshot.load("ArcyYeah")
      pbMessage(_INTL("\\tg[Arceus]...I'll take that as a compliment."))
      Mugshot.dispose
      pbMessage(_INTL("Relicanth swam away, leaving something behind."))
    },
    "MINIOR" => proc {
      pbMessage(_INTL("\\tg[Minior]Minior..."))
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]This Pokémon resides in the ozone layer, high above us."))
      Mugshot.load("ArcyDown")
      choice = pbMessage(_INTL("\\tg[Arceus]It drifts through the sky, serving as food for the Pokémon that live up there."), [
        _INTL("Is its purpose really just to be food for other Pokémon?"),
      ], -1)
      Mugshot.load("Arcy")
      pbMessage(_INTL("\\tg[Arceus]Well, yes. Life is balanced through these kind of roles, too."))
      Mugshot.load("ArcyThink")
      pbMessage(_INTL("\\tg[Arceus]I do wonder, though... do the different colors of Minior taste different?"))
      Mugshot.load("ArcyThinkA")
      pbMessage(_INTL("\\tg[Arceus]Perhaps next time I'll ask Rayquaza about it."))
      Mugshot.dispose
      pbMessage(_INTL("Minior floated away, leaving something behind."))
    }
  }

  dialogue_map.each do |keyword, block|
    if name.include?(keyword)
      block.call
      break
    end
  end

  others = [$items_TM, $items_evolution, $items_megastones]
  item = getSampleItem(others.sample)
  pbReceiveItem(item)

  $PokemonGlobal.dungeonPokeEvents.delete(species)
  $game_map.events[@event_id].character_name = ""
  refreshEventsDungeonLayout
  return true
end

