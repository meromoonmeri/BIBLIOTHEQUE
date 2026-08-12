
class PokemonGlobalMetadata
    attr_accessor :shopItemsRegister

      def shopItemsRegister
        if @shopItemsRegister.nil? || @shopItemsRegister.empty?
          @shopItemsRegister = []
        end
        @shopItemsRegister
    end

end

def setItemsFloor
  minimumItemCount = 5
  maximumItemCount = 20

  floor = $PokemonGlobal.dungeonFloor
  difficulty_ratio = floor.to_f / MAX_DIFFICULTY
  item_count = minimumItemCount + ((maximumItemCount - minimumItemCount) * difficulty_ratio).to_i

  all_healing_items = $items_berries + $items_healing + $items_evolution + $items_hold
  all_move_items    = $items_TM
  all_battle_items  = $items_battle_use + $items_gems + $items_balls

  items_to_remove = [
    :BLUKBERRY,
    :WEPEARBERRY,
    :CORNNBERRY,
    :MAGOSTBERRY,
    :RABUTABERRY,
    :NOMELBERRY,
    :SPELONBERRY,
    :PAMTREBERRY,
    :WATMELBERRY,
    :DURINBERRY,
    :BELUEBERRY,
    :TINYMUSHROOM,
    :BIGMUSHROOM,
    :PEARL,
    :NUGGET,
    :RAREBONE,
    :RELICCOPPER,
    :BALMMUSHROOM,
    :BIGPEARL,
    :PEARLSTRING,
    :STARDUST,
    :STARPIECE,
    :COMETSHARD,
    :BIGNUGGET,
    :RELICSILVER,
    :RELICGOLD,
    :RELICVASE,
    :RELICCROWN,
    :RELICSTATUE,
    :RELICBAND,
    :MASTERBALL,
    :PROTEIN,
    :IRON,
    :ZINC,
    :CALCIUM,
    :CARBOS,
    :HPUP,
    :FRESHSTARTMOCHI,
    :RARECANDY
  ]

  all_healing_items.reject! { |id| items_to_remove.include?(id) }
  
  healingArray = all_healing_items.sample([item_count, all_healing_items.size].min)
  moveArray    = all_move_items.sample([item_count, all_move_items.size].min)
  battleArray  = all_battle_items.sample([item_count, all_battle_items.size].min)

  $PokemonGlobal.shopItemsRegister = []
  $PokemonGlobal.shopItemsRegister = [healingArray, moveArray, battleArray]
end

def azelfTalk
    if !$game_switches[65]
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]I'm Azelf, the being of willpower."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]I handle battle items. Poké Balls, gems and the such."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]They're not free, however. Master's orders..."))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Wouldn't want the almighty creator lifting a finger, right?"))
        Mugshot.load("Azelf")
        pbMessage(_INTL("\\tg[Azelf]Willpower to shape the universe, but none to run a shop..."))
        Mugshot.dispose
        $game_switches[65] = true
    end
    azelf_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    Mugshot.load("Azelf")
    dialogues = [
    _INTL("I want to shop."),
    _INTL("I want to access the PC.")
    ]
    dialogues.push([_INTL("Is something up?"), Color.new(255,0,0), Color.new(0,0,0)]) if !azelf_dialogue.nil? && $PokemonGlobal.shopDialogue.include?(azelf_dialogue) && AZELF_DIALOGUES.include?(azelf_dialogue)
    dialogues.push(_INTL("Nothing, thank you."))
    choice = pbMessage(_INTL("\\tg[Azelf]How can I help?"), dialogues, -1)
    if choice == dialogues.length - 1
        Mugshot.dispose
        return
    end
    case choice
    when 0
        if $PokemonGlobal.shopItemsRegister[2]
            $PokemonGlobal.shopItemsRegister[2].each do |item|
                if GameData::Item.get(item).price == 0
                setPrice(item, 1000)
                end
            end
        end
        drugs = [:PROTEIN, :IRON, :ZINC, :CALCIUM, :CARBOS, :HPUP, :FRESHSTARTMOCHI, :RARECANDY]
        max_floor = $PokemonGlobal.registerFloor.max
        if max_floor >= 50
        price = 10
        else
        price = 4000 - (max_floor * ((4000 - 10).to_f / 49.0))
        price = price.clamp(10, 4000).to_i
        end
        drugs.each do |item|
            setPrice(item, price)
        end
        itemlist = drugs + $PokemonGlobal.shopItemsRegister[2].dup
        pbPokemonMart(itemlist, _INTL("What would you like to do?"))
    when 1
        pbFadeOutIn do
          scene = PokemonStorageScene.new
          screen = PokemonStorageScreen.new(scene, $PokemonStorage)
          screen.pbStartScreen(0)
        end
    when 2
        azelfRespite
    end
end

def mespritTalk
    if !$game_switches[66]
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]I'm Mesprit, the being of emotion! Lovely to meet you!"))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]I'm here to provide items to heal your Pokémon or help them evolve."))
        Mugshot.load("Mesprit")
        pbMessage(_INTL("\\tg[Mesprit]Of course, they're not gifts... Master says you have to pay."))
        Mugshot.load("MespritFunny")
        pbMessage(_INTL("\\tg[Mesprit]So cold, right? He has the emotional range of a rock."))
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]But don't worry! I'll try and make the transaction feel special... somehow!"))
        Mugshot.dispose
        $game_switches[66] = true
    end
    mesprit_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    Mugshot.load("MespritSmile")
    dialogues = [
        _INTL("I want to shop."),
        _INTL("I want to heal my Pokémon."),
    ]
    dialogues.push([_INTL("Is something up?"), Color.new(255,0,0), Color.new(0,0,0)]) if !mesprit_dialogue.nil? && $PokemonGlobal.shopDialogue.include?(mesprit_dialogue) && MESPRIT_DIALOGUES.include?(mesprit_dialogue)
    dialogues.push(_INTL("Nothing, thank you."))
    choice = pbMessage(_INTL("\\tg[Mesprit]Can I help you?"), dialogues, -1)
    if choice == dialogues.length - 1
        Mugshot.dispose
        return
    end
    case choice
    when 0
        if $PokemonGlobal.shopItemsRegister[0]
            $PokemonGlobal.shopItemsRegister[0].each do |item|
                if GameData::Item.get(item).price == 0
                setPrice(item, 1000)
                end
                shards = [:REDSHARD,:BLUESHARD,:YELLOWSHARD,:GREENSHARD]
                if shards.include?(GameData::Item.get(item))
                setPrice(item, 10000)
                end
            end
        end
        pbPokemonMart($PokemonGlobal.shopItemsRegister[0], _INTL("What would you like to do?"))
    when 1
        pbSEPlay("Use item in party")
        $player.heal_party
        Mugshot.load("MespritSmile")
        pbMessage(_INTL("\\tg[Mesprit]There! Everyone is as good as new!"))
        Mugshot.dispose
    when 2
        mespritRespite
    end
end

def uxieTalk
    if !$game_switches[67]
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]Greetings... I am Uxie, the being of knowledge."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]If your Pokémon seeks to master new moves, I can assist for a small fee. Master insists..."))
        Mugshot.load("Uxie")
        pbMessage(_INTL("\\tg[Uxie]I trust my services will prove enlightening to you."))
        Mugshot.dispose
        $game_switches[67] = true
    end
    uxie_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[1]

    Mugshot.load("Uxie")
    dialogues = [
    _INTL("I want to shop."),
    _INTL("Can I get a hint about my next opponent?"),
    _INTL("What time is it now?"),
    ]
    dialogues.push([_INTL("Is something up?"), Color.new(255,0,0), Color.new(0,0,0)]) if !uxie_dialogue.nil? && $PokemonGlobal.shopDialogue.include?(uxie_dialogue) && UXIE_DIALOGUES.include?(uxie_dialogue)
    dialogues.push(_INTL("Nothing, thank you."))
    choice = pbMessage(_INTL("\\tg[Uxie]How may I be of help?"), dialogues, -1)
    if choice == dialogues.length - 1
        Mugshot.dispose
        return
    end
    case choice
    when 0
        if $PokemonGlobal.shopItemsRegister[1]
            $PokemonGlobal.shopItemsRegister[1].each do |item|
                if GameData::Item.get(item).price == 0
                setPrice(item, 1000)
                end
            end
        end
        pbPokemonMart($PokemonGlobal.shopItemsRegister[1], _INTL("What would you like to do?"))
    when 1
        if $PokemonGlobal.dungeonFloor == 100
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Your next opponent is... Mmm."))
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Surely, that is something you are already well aware of."))
            Mugshot.dispose
        else
            type = type_for_leader($PokemonGlobal.dungeonNextRival, TRAINERS_ALL)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Your next opponent is quite savvy in the {1} type.", GameData::Type.get(type).name))
            Mugshot.dispose
        end
    when 2
        time_now = pbGetTimeNow
        hour = time_now.hour

        if PBDayNight.isMorning?(time_now)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, meaning it is morning.", hour))
            Mugshot.dispose
        elsif PBDayNight.isAfternoon?(time_now)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, meaning it is afternoon.", hour))
            Mugshot.dispose
        elsif PBDayNight.isEvening?(time_now)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, meaning it is evening.", hour))
            Mugshot.dispose
        elsif PBDayNight.isNight?(time_now)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, meaning it is night.", hour))
            Mugshot.dispose
        elsif PBDayNight.isDay?(time_now)
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, meaning it is daytime.", hour))
            Mugshot.dispose
        else
            Mugshot.load("Uxie")
            pbMessage(_INTL("\\tg[Uxie]Right now, it is around {1}, and I cannot determine the time of day.", time_now))
            Mugshot.dispose
        end
    when 3
        uxieRespite
    end
end

def type_for_leader(leader_symbol, trainer_hashes)
  trainer_hashes.each do |hash|
    return hash[leader_symbol][0] if hash.key?(leader_symbol)
  end
  nil
end