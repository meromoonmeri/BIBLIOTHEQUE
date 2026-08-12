def get_dialogues_for_floor(floor)
  return nil unless $PokemonGlobal.assignDialogueEvents
  $PokemonGlobal.assignDialogueEvents[floor]
end

class PokemonGlobalMetadata
    attr_accessor :respiteDialogue
    attr_accessor :shopDialogue
    attr_accessor :assignDialogueEvents

    def assignDialogueEvents
        @assignDialogueEvents ||= {}
        return @assignDialogueEvents
    end

    def respiteDialogue
        if @respiteDialogue.nil?# || @respiteDialogue.empty?
          @respiteDialogue = [
            :dialogue0,
            :dialogue1,
            :dialogue2,
            :dialogue3,
            :dialogue4,
            :dialogue5,
            :dialogue6,
            :dialogue7,
            :dialogue8,
            :dialogue9,
          ]
        end
        @respiteDialogue
    end

    def shopDialogue
        if @shopDialogue.nil?# || @shopDialogue.empty?
          @shopDialogue = [
            :shopdialogue0,
            :shopdialogue1,
            :shopdialogue2,
            :shopdialogue3,
            :shopdialogue4,
            :shopdialogue5,
            :shopdialogue6,
            :shopdialogue7,
            :shopdialogue8,
            :shopdialogue9
          ]
        end
        @shopDialogue
    end
end

def arcyTutorial
    voice("Arcy", :curious)
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]It looks like a strong foe awaits us on the next floor."))
    Mugshot.load("ArcyDown")
    pbMessage(_INTL("\\tg[Arceus]Prepare yourself accordingly."))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]By the way, have you found any Shards while climbing the tower?"))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]If you have, hand them over to me."))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]I'll offer you different things in exchange for them."))
    Mugshot.load("ArcyThink")
    pbMessage(_INTL("\\tg[Arceus]Huh? Why don't I just do it myself, if we're in this together?"))
    Mugshot.load("ArcyThinkA")
    pbMessage(_INTL("\\tg[Arceus]I could say only those Shards give me the power to act... but that wouldn't be the truth."))
    Mugshot.load("ArcyThinkB")
    pbMessage(_INTL("\\tg[Arceus]I simply want to make things more interesting."))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]In return for the Shards, I can offer information about your next opponent, items, or modifications to your Pokémon team."))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]And when you face your opponent, I'll be cheering you on from the back."))
    Mugshot.load("ArcyShrug")
    choice = pbMessage(_INTL("\\tg[Arceus]\"Yaaay. \\PN's the best. Yaaay.\""),
    [
    _INTL("You're not exactly making this easier...")
    ], -1)
    Mugshot.load("ArcyShrugA")
    pbMessage(_INTL("\\tg[Arceus]I'm just trying to make this journey as entertaining as possible for both of us."))
    Mugshot.load("ArcyShrugA")
    pbMessage(_INTL("\\tg[Arceus]Easier doesn't always mean better."))
    Mugshot.dispose
end

class PokemonGlobalMetadata
    attr_accessor :registerFloor

      def registerFloor
        if @registerFloor.nil? || @registerFloor.empty?
          @registerFloor = [0]
        end
        @registerFloor
    end

end

def arcyRespiteChoice

    if $PokemonGlobal.dungeonFloor >= 50 && !$bag.has?(:MEGARING)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Here, catch."))
        Mugshot.dispose
        pbReceiveItem(:MEGARING)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahaha... the look on your face was priceless."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]As you've probably realized, this item lets your Pokémon Mega Evolve."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]I'm giving it to you now because from this point on, it becomes part of the game's rules."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]This should make things much more interesting."))
        Mugshot.dispose
        return
    end

    arcy_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)

    voice("Arcy", :curious)
    Mugshot.load("ArcyShrug")
    dialogues = [
    _INTL("I want Legendary Pokémon."),
    _INTL("I'm bored..."),
    _INTL("I want to change floors..."),
    _INTL("I'm looking for a Pokémon...")
    ]
    dialogues.push([_INTL("Is something up?"), Color.new(255,0,0), Color.new(0,0,0)]) if !arcy_dialogue.nil? && $PokemonGlobal.respiteDialogue.include?(arcy_dialogue[0])
    dialogues.push(_INTL("Nothing, keep up the divine alpaca work."))
    choice = pbMessage(_INTL("\\tg[Arceus]...Yes? How may I be of service to you?"), dialogues, -1)
    if choice == dialogues.length - 1
        Mugshot.load("ArcyYeah")
        pbMessage(_INTL("\\tg[Arceus]...As thou wilt..."))
        Mugshot.dispose
        return
    end
    case choice
    when 0
        legendaryPick
    when 1
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahaha... Now, I can't allow that to happen, can I?"))
        Mugshot.dispose
        ArcyContest.new
    when 2
        changeFloorArcy
    when 3
        tellPokemonRates
    when 4
        arcyRespite
    end
    Mugshot.dispose
end

def tellPokemonRates
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]Which species is it that you're looking for?"))
    Mugshot.dispose
    pick = pbEnterSearchText(pbGetAllSpeciesNames, [:alphabetical, :restrict])
    if pick == -1
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]...I understand."))
        Mugshot.dispose
        return
    end
    list = []
    GameData::Species.each_species do |data|
        list.push(data.id)
    end
    echoln list[pick]
    Mugshot.load("ArcyThink")
    if LEGEND_BLACKLIST.include?(list[pick])
        pbMessage(_INTL("\\tg[Arceus]Oh, that's quite the unusual Pokémon you're asking for. Legendary, even."))
        Mugshot.load("ArcyThinkB")
        choice = pbMessage(_INTL("\\tg[Arceus]Maybe, if you asked nicely, someone around here could summon of those for you..."), [
        _INTL("Maybe I don't want it anymore..."),
        _INTL("You have it, don't you...")
        ], -1)
        Mugshot.load("ArcyYeah")
        if choice == 0
            pbMessage(_INTL("\\tg[Arceus]...I understand."))
        else
            pbMessage(_INTL("\\tg[Arceus]Perhaps I do."))
        end
        Mugshot.dispose
        return
    end
    pbMessage(_INTL("\\tg[Arceus]{1}, yes? This one appears at...", GameData::Species.get(list[pick]).name))
    dist = pokemon_difficulty_distribution(list[pick])
    dist.each do |difficulty, chance|
        next if chance <= 0
        next if difficulty % 10 == 0
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]...Floor {1} with a {2}% chance...", difficulty, chance))
        # echoln "Difficulty #{difficulty}: #{chance}% chance to encounter this Pokémon"
    end
    Mugshot.load("ArcyThinkB")
    pbMessage(_INTL("\\tg[Arceus]...And that's it."))
    Mugshot.dispose
=begin
    choice = pbMessage(_INTL("\\tg[Arceus]...And that's it. What do you think?"), [
    _INTL("Very good, thank you.")
    ], -1)
    Mugshot.load("ArcyDown")
    choice = pbMessage(_INTL("\\tg[Arceus]Those numbers are accurate. Don't you have anything else to say?"), [
    _INTL("Not really, no...")
    ], -1)
    Mugshot.load("ArcyYeah")
    pbMessage(_INTL("\\tg[Arceus]I see."))
    Mugshot.dispose
=end
end

def visitedFloor?
    return false if $PokemonGlobal.registerFloor.empty?
    return $PokemonGlobal.dungeonFloor <= $PokemonGlobal.registerFloor.max
end

def addDungeonFloor
    $PokemonGlobal.registerFloor.push($PokemonGlobal.dungeonFloor) if !$PokemonGlobal.registerFloor.include?($PokemonGlobal.dungeonFloor)
end

def changeFloorArcy
    visitedFloors = $PokemonGlobal.registerFloor.dup
    filteredFloors = visitedFloors.reject { |floor| floor % 10 == 5 || floor == 0 }

    options = filteredFloors.map { |floor| _INTL("Floor {1}", floor) }

    options.unshift(_INTL("Let's go back to the tower entrance..."))
    options.unshift(_INTL("I changed my mind, this floor seems exceptionally cozy."))

    Mugshot.load("Arcy")
    choice = pbMessage(_INTL("\\tg[Arceus]Where to?"), options, 1)
    Mugshot.dispose

    if choice == 0
        Mugshot.load("ArcyYeah")
        pbMessage(_INTL("\\tg[Arceus]...Very well then..."))
        Mugshot.dispose
    elsif choice == 1
        if !visitedFloors.include?($PokemonGlobal.dungeonFloor)
            Mugshot.load("ArcyThink")
            pbMessage(_INTL("\\tg[Arceus]Looks like you haven't cleared the current floor yet."))
            Mugshot.load("ArcyThinkB")
            if !pbConfirmMessage(_INTL("\\tg[Arceus]If you leave for another floor, you'll have to walk all the way back here again. Is that alright?"))
                Mugshot.dispose
                return
            end
        end
        echoln "Floor will be changed to: 0"
        $PokemonGlobal.dungeonFloor = 0
        pbCommonEvent(6)
    else
        chosenFloor = filteredFloors[choice - 2]
        if !visitedFloors.include?($PokemonGlobal.dungeonFloor)
            Mugshot.load("ArcyThink")
            pbMessage(_INTL("\\tg[Arceus]Looks like you haven't cleared the current floor yet."))
            Mugshot.load("ArcyThinkB")
            if !pbConfirmMessage(_INTL("\\tg[Arceus]If you leave for another floor, you'll have to walk all the way back here again. Is that alright?"))
                Mugshot.dispose
                return
            end
        end
        echoln "Floor will be changed to: #{chosenFloor}"
        $PokemonGlobal.dungeonFloor = chosenFloor
        pbCommonEvent(5)
    end
end

BODY_COLOR_SHARD_ITEMS = {
  :Red    => :REDSHARD,
  :Blue   => :BLUESHARD,
  :Yellow => :YELLOWSHARD,
  :Green  => :GREENSHARD,
  :Black  => :BLUESHARD,
  :Brown  => :REDSHARD,
  :Purple => :BLUESHARD, 
  :Gray   => :BLUESHARD,
  :White  => :YELLOWSHARD,
  :Pink   => :REDSHARD
}

def pbGetLegendaryNames
  ret = []
  LEGEND_BLACKLIST.each do |species_symbol|
    data = GameData::Species.try_get(species_symbol)
    ret.push(data.name) if data
  end
  return ret
end

FRAGMENT_SWITCH = 72
def legendaryPick
    list = LEGEND_BLACKLIST.sort_by { |species| GameData::Species.get(species).id }
    namelist = [_INTL("I changed my mind.")] + list.map { |species| GameData::Species.get(species).name }
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]But of course. Which one is it that you want?"))
    if !$game_switches[FRAGMENT_SWITCH]
        $game_switches[FRAGMENT_SWITCH] = true
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]You will need to gather Shards of different colors in exchange. You can obtain them randomly as you climb the tower."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]They are also sometimes found on sale in shops... And if you play a certain minigame with me, I might give you some too."))
    end
    Mugshot.dispose
    choice = pbEnterSearchText(pbGetLegendaryNames, [:alphabetical, :restrict], _INTL("Enter a species"))

    if choice == -1
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]...I understand."))
        Mugshot.dispose
        return
    end

    pick = LEGEND_BLACKLIST[choice]

    minQty = 3
    maxQty = 10

    bst_values = LEGEND_BLACKLIST.map { |species| get_base_stat_total(species) }
    minBST = bst_values.min
    maxBST = bst_values.max

    bst   = get_base_stat_total(pick)
    color = GameData::Species.get(pick).color
    item  = BODY_COLOR_SHARD_ITEMS[color]

    clamped_bst = [[bst, minBST].max, maxBST].min
    quantity = minQty + ((clamped_bst - minBST) * (maxQty - minQty) / (maxBST - minBST).to_f).round

    legendDialogue(pick)
    Mugshot.load("ArcyThink")
    if pbConfirmMessage(_INTL("\\tg[Arceus]So {1} is it, then? I'll take {2} {3} for that.", GameData::Species.get(pick).name, quantity, GameData::Item.get(item).name_plural))
        if $bag.has?(item, quantity)
            $bag.remove(item, quantity)

            # im sorry for all this
            value = $PokemonSystem.givenicknames
            pkmn = Pokemon.new(pick, getLevelCap)
            Mugshot.load("ArcyThinkB")
            if pbConfirmMessage(_INTL("\\tg[Arceus]...There you go. Will you give it a nickname?"))
                Mugshot.dispose
                newname = pbEnterPokemonName(_INTL("{1}'s nickname?", pkmn.speciesName),0, Pokemon::MAX_NAME_SIZE, "", pkmn)
                pkmn.name = newname
                namepickResponse(pkmn.name) if pick == :ARCEUS
            end
            $PokemonSystem.givenicknames = false
            pbAddPokemon(pkmn)

            $PokemonSystem.givenicknames = value
        else
            Mugshot.load("ArcyThinkB")
            pbMessage(_INTL("\\tg[Arceus]You don't have enough fragments for that, I'm afraid."))
            Mugshot.dispose
        end
    end
end

def namepickResponse(name)
  name = name.downcase
  if name.include?("aus")
    Mugshot.load("ArcySmile")
    pbMessage(_INTL("\\tg[Arceus]Why... you..."))
  elsif name.include?("babygirl")
    Mugshot.load("ArcyShrug")
    pbMessage(_INTL("\\tg[Arceus]...I'll take this as a compliment."))
  elsif name.include?("chonky") || name.include?("fat") || name.include?("chubby")
    Mugshot.load("ArcyYeah")
    pbMessage(_INTL("\\tg[Arceus]Your stubbornness in calling me that is somewhat amusing."))
  end
  Mugshot.dispose
end

def legendDialogue(species)
    case species
    when :NINCADA, :SHEDINJA
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]The best tricks always seem to cost the most, don't they? Hahaha..."))
    when :LUGIA
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The Guardian of the Sea... Honestly, I hesitated before assigning them that role."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]In the end, I believe they served their purpose well."))
    when :HOOH
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Johto's Guardian, always so intent on achieving perfection..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]I suppose I should be glad they take the role so seriously, but I must admit... it's made things way less entertaining for me."))
    when :KYOGRE
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]...This one's become quite the popular pick as of late, hasn't he?"))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Of course, I can see the appeal. Someone so unpredictable, slipping beyond even my control... Hahahahahaha..."))
    when :UXIE
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]...Is it knowledge you seek?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]The more you know, the fewer surprises you'll encounter."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]I would think carefully about that."))
    when :AZELF
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Are you perhaps interested in strengthening your own will?"))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]...Why bother?"))
    when :MESPRIT
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Are you attracted to strong emotions?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]Then surely, having me around all this time has been a delight for you."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]...That was a joke."))
    when :PALKIA
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]I once asked her to distort the space around the Hall of Origin. I said, \"Show me something that might stir a reaction in me.\""))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]...And she turned it into the Distortion World."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]...What I'm saying is, be careful with what you ask of her."))
    when :DIALGA
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]I once asked <c3=1784ff>Dialga</c3> to show me a moment in time that would entertain me."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]She made me watch a Magikarp jump competition until one of them hit 100 meters."))
        Mugshot.load("ArcyYeah")
        pbMessage(_INTL("\\tg[Arceus]That took... way too long, even for me."))
    when :GIRATINA
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahahaha... I wonder if there's any meaning behind this pick?"))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]This one bites. Use him wisely... or you may meet the fate he intended for me."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]And I accept no refunds."))
    when :ARCEUS
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahaha... Very well. I'll have an illusion of myself to accompany you."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Just know that since I'm only a fragment of my true self, I can't create any more of the real ones."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]It should be enough for what you need, however."))
    when :NECROZMA
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Necrozma... I don't know much about that... beast."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]Still, he's definitely caught my interest. From what little I do know, his potential might even rival my own."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]I believe I have some records... Let me think... what was it again?"))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]\"Bwa-ha-ha-ha-ha... Fear not, for I shall return, and everyone will bask in my brilliance once more...\""))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]...Something along those lines."))
    when :REGIGIGAS
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]The one whose power I had to seal... as I judged it far too great to be left unchecked."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Still, rest assured. They're quite dependable, if a bit... eccentric."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]They do tend to sleep a lot, though. Perhaps they'll appreciate being awakened for this."))
    when :HOOPA
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Someone with power like hers is bound to be limited in one way or another."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]I'll have her work for you... temporarily. Hahahahaha..."))
    when :CALYREX
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]\"Just how big should I make this one's head?\""))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]...You could say my indecisiveness is to blame."))
    when :GROUDON
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]Quite the peculiar one, she is. The kind who'd punch you in the face and laugh while doing it just for the thrill."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]It's people like her that entertain me the most. Hahahaha..."))
    when :RAYQUAZA
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Rayquaza... It does love playing the hero, always following its own judgment."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]But in the end, it's my judgment that truly matters."))
    end
    Mugshot.dispose
end

def arcyRespite
    arcy_dialogue = get_dialogues_for_floor($PokemonGlobal.dungeonFloor)[0]
    case arcy_dialogue
    when :dialogue0
        voice("Arcy", :curious)
        Mugshot.load("ArcyThink")
        choice = pbMessage(_INTL("\\tg[Arceus]You have a little braid in your hair. That's cute."), [
        _INTL("You seem to like braids too.")
        ], -1)
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Well, that's because if I untie mine..."))
        Mugshot.dispose
        pbWait(0.8)
        Mugshot.load("ArcyHair")
        pbMessage(_INTL("\\tg[Arceus]This happens."))
        Mugshot.load("ArcyHair")
        pbMessage(_INTL("\\tg[Arceus]My hair starts floating upward unnaturally. It tends to unsettle people."))
        Mugshot.load("ArcyHair")
        pbMessage(_INTL("\\tg[Arceus]So, I keep it tied."))
        Mugshot.load("ArcyHair")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyHairYeah")
        pbMessage(_INTL("\\tg[Arceus]Would you mind helping me fix it?"))
        Mugshot.dispose
        pbWait(0.8)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]...Thank you."))
        Mugshot.dispose
    when :dialogue1
        voice("Arcy", :nod)
        Mugshot.load("ArcyThink")
        choice = pbMessage(_INTL("\\tg[Arceus]Time has been distorted here, and I was trying to guess what time it is."), [
        _INTL("What for?")
        ], -1)
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Nothing important. Just a habit."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]I've seen how things go in the mornings from up here."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]The bakery opens, which means... it's time to buy bread."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]...Why that look?"))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Bread tastes best when it's fresh out of the oven, first thing in the morning."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]If you can't appreciate that... I genuinely pity you."))
        Mugshot.dispose
    when :dialogue2
        voice("Arcy", :nod)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]As a god, I carry the burden of delivering justice to the world."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]So, let me ask you something that's been on my mind."))
        Mugshot.load("ArcyThinkA")
        choice = pbMessage(_INTL("\\tg[Arceus]If someone committed terrible crimes but then lost all their memories... everything they were, everything they did... should they still be judged for it?"), [
        _INTL("They should be judged..."),
        _INTL("They shouldn't be judged...")
        ], -1)

        if choice == 0
            Mugshot.load("ArcyThinkB")
            pbMessage(_INTL("\\tg[Arceus]Is that so? They might as well be considered as a new person."))
            Mugshot.load("ArcySmile")
            pbMessage(_INTL("\\tg[Arceus]They'd probably beg you to believe they're innocent... unaware of who they once were. Punishing them wouldn't change anything."))
            Mugshot.load("ArcySmile")
            pbMessage(_INTL("\\tg[Arceus]Not exactly the most empathetic approach, wouldn't you agree?"))
        else
            Mugshot.load("ArcyThinkB")
            pbMessage(_INTL("\\tg[Arceus]Still... it's complicated, isn't it?"))
            Mugshot.load("ArcyDown")
            pbMessage(_INTL("\\tg[Arceus]What if they erased their memories on purpose to avoid the consequences?"))
            Mugshot.load("Arcy")
            pbMessage(_INTL("\\tg[Arceus]They'd get exactly what they wanted... and walk away unpunished."))
            Mugshot.load("ArcyDown")
            pbMessage(_INTL("\\tg[Arceus]That's the thing about memories... They're everything. They shape who we are."))
        end
        Mugshot.dispose
    when :dialogue3
        voice("Arcy", :curious)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Do you have a favorite Pokémon?"))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]There's so much variety, isn't there? I still come up with new ones from time to time."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]I once thought it would be nice if everyone could find a favorite; something that made them feel understood."))
        Mugshot.load("ArcyDown")
        choice = pbMessage(_INTL("\\tg[Arceus]But over time, I stopped thinking much about things like that."), [
        _INTL("Do you, as the Creator, have a favorite?")
        ], -1)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]That's like asking a proud parent to choose their favorite child."))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]If I must answer, it's the ones related to pastries I like the most."))
        Mugshot.dispose
    when :dialogue4
        voice("Arcy", :nod)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Have you noticed the sound that follows me when I walk?"))
        Mugshot.load("ArcyShrugA")
        pbMessage(_INTL("\\tg[Arceus]It's like a soft \"twinkle, twinkle\". Surely, you've heard it."))
        Mugshot.load("ArcyShrugA")
        choice = pbMessage(_INTL("\\tg[Arceus]I sometimes wonder... would it become tiring to hear it over and over?"), [
        _INTL("It's soothing"),
        _INTL("It's annoying")
        ], -1)
        case choice
        when 0
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]Is that so? I chose it myself, you know."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]If I must walk this world, I might as well leave behind something pleasant."))
        when 1
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]I suppose not everyone can appreciate greatness when they hear it."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]But oh well. It will keep playing anyway."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Consider it a lesson in patience... courtesy of the one who made patience itself."))
        end
        Mugshot.dispose
    when :dialogue5
        voice("Arcy", :nod)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]I created every Pokémon with a purpose... a role to play in the world, without exception."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]<c3=1784ff>Dialga</c3> governs time and <c3=e147f1>Palkia</c3> controls space. Kyogre shapes the seas, Groudon molds the land..."))
        Mugshot.load("ArcyShrug")
        choice = pbMessage(_INTL("\\tg[Arceus]And Magikarp just jump around. A seemingly useless purpose, but a purpose nonetheless."), [
        _INTL("What about Pokémon you didn't create?")
        ], -1)
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]It doesn't matter. If you're a Pokémon, you have a purpose."))
        Mugshot.load("Arcy")
        choice = pbMessage(_INTL("\\tg[Arceus]That's how the rules work."), [
        _INTL("Do you have a purpose, too?")
        ], -1)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Who knows? Maybe what I enjoy doing is a purpose given to me, and I'm not even aware of it."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Why bother questioning if what you do is truly your own will? If you enjoy it, you simply do it."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Honestly, I think not having a purpose would be a bit sad. Hahaha..."))
        Mugshot.dispose
    when :dialogue6
        voice("Arcy", :nod)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Have you seen my notebook? It has my engravings, so it's pretty clear that it belongs to me."))
        Mugshot.load("ArcyThinkA")
        choice = pbMessage(_INTL("\\tg[Arceus]I must have dropped it somewhere. Hopefully it didn't end up in another dimension somehow..."), [
        _INTL("What's written in there?"),
        ], -1)
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]Ah, nothing much. Just some of the stories I used to write sometimes."))
        Mugshot.load("ArcyThinkB")
        choice = pbMessage(_INTL("\\tg[Arceus]Things I wished would eventually happen in any of the worlds I watched, but didn't."), [
        _INTL("So, like... fictional stories...?"),
        ], -1)
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]That is correct."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]I heard it's something the delusional usually do. However, I find it to be quite the creative hobby."))
        Mugshot.dispose
    when :dialogue7
        voice("Arcy", :nod)
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]Names are curious things, don't you think?"))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]They are supposed to define us, but all they truly do is serve as a label."))
        Mugshot.load("ArcyThinkB")
        choice = pbMessage(_INTL("\\tg[Arceus]I was named \"Arceus\" by those who glimpsed but a fraction of what I am."), [
        _INTL("If you could have chosen your own name, what would it be?"),
        ], -1)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]...A name of my own?"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]\"Aus\"..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]However, that is a name tied to things I have already lost."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]A name for something I can never be."))
        Mugshot.load("ArcyDown")
        choice = pbMessage(_INTL("\\tg[Arceus]Thus, I will never claim that name for myself."), [
            _INTL("But if you could...?"),
        ], -1)
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Then perhaps I would be worthy of it, I suppose."))
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]But that is not how this world works."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus](...)"))
        Mugshot.dispose
    when :dialogue8
        voice("Arcy", :nod)
        Mugshot.load("ArcyThink")
        choice = pbMessage(_INTL("\\tg[Arceus]Mmm... That Space Globe I gave you earlier..."), [
            _INTL("Me no take backsies."),
        ], -1)
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Don't worry, I've no intention of taking it back from you."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]I can't help but wonder, though... Does that mean you've found it interesting?"))
        Mugshot.load("ArcySmile")
        choice = pbMessage(_INTL("\\tg[Arceus]Truthfully, I'm quite curious about what you're seeing... Hahahaha..."), [
            _INTL("I'm not telling you."),
            _INTL("Forget it, I don't trust you."),
        ], -1)
        Mugshot.load("ArcyShrug")
        pbMessage(_INTL("\\tg[Arceus]Fair enough. It is your reward, after all."))
        Mugshot.load("ArcyShrugB")
        pbMessage(_INTL("\\tg[Arceus]Perhaps it's for the best. If it were something that caught my interest, yet remained beyond my reach..."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Hahahaha... Now I would truly hate that."))
        Mugshot.dispose
    when :dialogue9
        voice("Arcy", :curious)
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]It's been so long since anything remotely interesting has happened... Ah, I'm glad I found you..."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]Before you arrived, all I did was stand watch atop the tower, simply observing the world as it moved along."))
        Mugshot.load("ArcyDown")
        pbMessage(_INTL("\\tg[Arceus]As an overwhelmingly powerful being, I don't allow myself to interfere unless it's a matter of absolute emergency."))
        Mugshot.load("Arcy")
        pbMessage(_INTL("\\tg[Arceus]And even then, it's only happened a handful of times."))
        Mugshot.load("ArcyThink")
        pbMessage(_INTL("\\tg[Arceus]I recall one occasion, when the world was on a direct path to collide with the sun... I called upon every Legendary Pokémon to help prevent total annihilation."))
        Mugshot.load("ArcyThinkA")
        pbMessage(_INTL("\\tg[Arceus]As you might imagine, the crisis was ultimately averted."))
        Mugshot.load("ArcyThinkB")
        pbMessage(_INTL("\\tg[Arceus]Still... if the planet and everyone on it had been doomed to crash into the sun instead..."))
        Mugshot.load("ArcySmile")
        pbMessage(_INTL("\\tg[Arceus]Haha... Hahahaha..."))
        Mugshot.dispose
    end
    echoln arcy_dialogue
    giveCandyItem
    $PokemonGlobal.respiteDialogue.delete(arcy_dialogue)
    echoln $PokemonGlobal.respiteDialogue
end


def spaceGlobeCutscene
    # make it so that it calculates the variable according to the floor
    # i.e. at 10 if variable is >=1 dont trigger
    # i.e. at 20 if variable is >= 2 dont trigger
    # p $game_variables[31]
    # p ($PokemonGlobal.dungeonFloor / 10).floor
    return false if $game_variables[31] > 8 || $game_variables[31] >= ($PokemonGlobal.dungeonFloor / 10).floor
    viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    viewport.z = 99999
    sprites = {}
    sprites["mallieBolas"] = Sprite.new(viewport)
    sprites["mallieBolas"].bitmap = pbBitmap("Graphics/Pictures/MallieSpaceGlobe")
    sprites["mallieBolas"].bitmap.play if sprites["mallieBolas"].bitmap.animated?

    pbFadeInAndShow(sprites)
    pbWait(0.6)

    confirm = false
    choice = false

    loop do
        if pbConfirmMessage(_INTL("The Space Globe is shining brilliantly... Would you like to take a peek inside?"))
            confirm = true
            choice = true
        else
            if pbConfirmMessage(_INTL("Are you sure? You'll miss the chance to watch this scene."))
                confirm = true
                choice = false
            end
        end
        break if confirm
    end

    pbToneChangeAll(Tone.new(-255, -255, -255, 0),0) if choice
    pbWait(0.6)

    pbFadeOutAndHide(sprites)
    pbDisposeSpriteHash(sprites)
    viewport.dispose

    if choice
        pbWait(2)
        sceneBolaPick
    else
        return false
    end
end

def sceneBolaPick
    story = $game_variables[31]

    newX = 1; newY = 1; newID = 1

    case story
    when 0
        newX = 10; newY = 10; newID = 16
    when 1
        newX = 12; newY = 7; newID = 18
    when 2
        newX = 12; newY = 14; newID = 17
    when 3
        newX = 12; newY = 10; newID = 20
    when 4
        newX = 14; newY = 11; newID = 21
    when 5
        newX = 12; newY = 7; newID = 18
    when 6
        newX = 18; newY = 11; newID = 23
    when 7
        newX = 12; newY = 7; newID = 18
    when 8
        newX = 12; newY = 9; newID = 24
    end

    if $scene.is_a?(Scene_Map)
        $game_temp.player_new_map_id    = newID
        $game_temp.player_new_x         = newX
        $game_temp.player_new_y         = newY
        $game_temp.player_new_direction = 2
        $scene.transfer_player
    end
    $game_map.refresh
    
    $game_variables[31] += 1
end

def arcyTeDaSuBola
    return if $PokemonGlobal.dungeonFloor % 10 != 0
    return if $bag.has?(:SPACEGLOBE)

    pbWait(1.2)
    voice("Arcy", :curious)
    Mugshot.load("ArcyThink")
    choice = pbMessage(_INTL("\\tg[Arceus]...Something troubling you? Why the long face?"), [
        _INTL("Is it going to be like this all the way up?"),
    ], -1)
    Mugshot.load("ArcyThinkB")
    choice = pbMessage(_INTL("\\tg[Arceus]Yes. Those are the rules of the game."), [
        _INTL("That's unfair to me, and honestly, it's boring..."),
    ], -1)
    Mugshot.load("ArcyDown")
    pbMessage(_INTL("\\tg[Arceus](...)"))
    Mugshot.load("ArcySmile")
    pbMessage(_INTL("\\tg[Arceus]Hahahaha... Perhaps you're right."))
    Mugshot.load("ArcyShrug")
    pbMessage(_INTL("\\tg[Arceus]Very well, then. Take this."))
    Mugshot.dispose

    pbReceiveItem(:SPACEGLOBE)

    Mugshot.load("ArcyShrugB")
    pbMessage(_INTL("\\tg[Arceus]This item was originally meant for Pokémon to wield. For humans, however, it works a bit differently."))
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]From time to time, it will let you catch a glimpse into another time or dimension."))
    Mugshot.load("ArcyDown")
    choice = pbMessage(_INTL("\\tg[Arceus]Quite the amusing little trinket, don't you think? Consider it an incentive."), [
        _INTL("If it's so amusing, why don't you use it yourself?"),
    ], -1)
    Mugshot.load("Arcy")
    pbMessage(_INTL("\\tg[Arceus]As I said... the effect only works on humans. This fragment of me is still a Pokémon at its core, so those rules don't apply."))
    Mugshot.load("ArcySmile")
    pbMessage(_INTL("\\tg[Arceus]In any case, make good use of it. I can't have you quitting the game out of boredom, can I?"))
    Mugshot.dispose

end
