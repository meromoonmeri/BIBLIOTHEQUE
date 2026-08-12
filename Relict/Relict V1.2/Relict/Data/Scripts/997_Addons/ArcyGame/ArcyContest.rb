class PokemonGlobalMetadata
    attr_accessor :pokemonListContest
    attr_accessor :rewardTrackContest
    attr_accessor :lastRewardPercent

    def pokemonListContest
      if @pokemonListContest.nil?
        @pokemonListContest = []
        GameData::Species.each do |species|
          next if species.form != 0
          @pokemonListContest << species
        end
      end

      return @pokemonListContest
    end

    def rewardTrackContest
      return @rewardTrackContest ||= []
    end

    def lastRewardPercent
      return @lastRewardPercent ||= 0.0
    end
end

CONTEST_STUFFS_TO_ASK = [:height, :weight, :color, :generation, :type, :letter, :evolve, :ability, :stats]
CONTEST_TUTORIAL_SWITCH = 64

class ArcyContest
  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @tweener = Tweener.new

    @chooseSpecies = $PokemonGlobal.pokemonListContest.sample
    echoln @chooseSpecies.name
    @picks = [] # CONTEST_STUFFS_TO_ASK
    @picks.push(CONTEST_STUFFS_TO_ASK.sample)
    @tutorial = $game_switches[CONTEST_TUTORIAL_SWITCH]

    @lives = 5
    @currentlives = @lives
    @playingBGM = $game_system.playing_bgm

    setup
  end

  def getRewards
    others = [$items_TM, $items_evolution, $items_megastones]
    reward_interval = 0.2  # in percent

    totalPokes  = $PokemonGlobal.rewardTrackContest.length + $PokemonGlobal.pokemonListContest.length
    foundPokes = $PokemonGlobal.rewardTrackContest.length
    return if totalPokes == 0

    progress_percent = (foundPokes.to_f / totalPokes) * 100.0

    scale = (1.0 / reward_interval).round
    milestone_index = (progress_percent * scale).floor
    current_milestone_percent = milestone_index.to_f / scale
    next_milestone_percent = (milestone_index + 1).to_f / scale

    current_goal = ((current_milestone_percent / 100.0) * totalPokes).ceil
    next_goal = ((next_milestone_percent / 100.0) * totalPokes).ceil

    if progress_percent >= current_milestone_percent && current_milestone_percent > $PokemonGlobal.lastRewardPercent
      shards = [:BLUESHARD,:GREENSHARD,:REDSHARD,:YELLOWSHARD]
      item = rand(8) == 0 ? shards.sample : getSampleItem(others.sample)
      pbMessage(_INTL("\\tg[Arceus]Here's a little reward for you."))
      pbReceiveItem(item)

      $PokemonGlobal.lastRewardPercent = current_milestone_percent

      pbMessage(_INTL("\\tg[Arceus]I'll give you something else if you reach {1} species.", next_goal))
    else
      pbMessage(_INTL("\\tg[Arceus]I'll give you something if you reach {1} species.", next_goal))
    end
  end

  def getQuestionTextContest(choice)
    case choice
    when :height
      return _INTL("About its height...")
    when :weight
      return _INTL("About its weight...")
    when :color
      return _INTL("What color is it?")
    when :generation
      return _INTL("Which generation does it come from?")
    when :type
      return _INTL("What type does it have?")
    when :letter
      return _INTL("What letter does its name start with?")
    when :evolve
      return _INTL("Can it evolve?")
    when :ability
      return _INTL("What ability might it have?")
    when :stats
      return _INTL("What is its strongest stat?")
    end
  end

  def reshuffle_options
    options = []
    available_choices = CONTEST_STUFFS_TO_ASK - @picks
    new_choices = available_choices.sample(3) || []

    new_choices.each do |choice|
      options << getQuestionTextContest(choice)
    end

    return [new_choices, options]
  end

  def pick_question
    pokelist = []
    GameData::Species.each do |species|
      pokelist << species.id
    end
    loop do
      if lastLive?
        options = []
        options.push(_INTL("Let me guess..."))
        options.push(_INTL("I want to go."))
        exit_index = options.length - 1
        guess_index = options.length - 2
        choice = pbMessage(_INTL("This is your last chance to guess. Which Pokémon is it?"), options, options.length)
      else
        new_choices, options = reshuffle_options
        options.push(_INTL("Let me guess..."))
        options.push(_INTL("I want to go."))
        exit_index = options.length - 1
        guess_index = options.length - 2
        choice = pbMessage(_INTL("Ask a question, or try to guess the Pokémon I'm thinking of."), options, options.length)
      end
      case choice
      when exit_index
        dispose
        break
      when guess_index
        guess = pbEnterSearchText(pbGetAllSpeciesNames, [:alphabetical, :restrict])
        if guess == -1
          next
        elsif pokelist[guess] == @chooseSpecies.id
          addSpeciesToList
          next
        else
          @currentlives -= 1
          updateHearts
          pbPlayBuzzerSE
          changesprite("arcy", "arcy_shrug")
          pbMessage(_INTL("\\tg[Arceus]Bzzzt... That's not correct."))
          changesprite("arcy", "arcy_normal")
          if noMoreLives?
            pbMessage(_INTL("\\tg[Arceus]Looks like you're out of hearts. The Pokémon I was thinking of was {1}.", @chooseSpecies.name))
            pbMessage(_INTL("\\tg[Arceus]Let's try a different one."))
            refillHearts
            @chooseSpecies = $PokemonGlobal.pokemonListContest.sample
            echoln @chooseSpecies.name
            @picks = []
            @picks.push(CONTEST_STUFFS_TO_ASK.sample)
            tip_text = getSpeciesDataContest(@chooseSpecies, @picks[0], true)
            changesprite("arcy", "arcy_shrug")
            pbMessage(_INTL("\\tg[Arceus]" + tip_text))
            changesprite("arcy", "arcy_normal")
            addTips
          end
        end
      else
        if !noMoreLives?
          @picks.push(new_choices[choice])
          tip_text = getSpeciesDataContest(@chooseSpecies, new_choices[choice], true)
          changesprite("arcy", "arcy_shrug")
          pbMessage(_INTL("\\tg[Arceus]{1}", tip_text))
          changesprite("arcy", "arcy_normal")
          addTips
          @currentlives -= 1
          updateHearts
        end
      end
    end
  end

  def addSpeciesToList
    $PokemonGlobal.pokemonListContest.delete(@chooseSpecies)
    $PokemonGlobal.rewardTrackContest.push(@chooseSpecies)
    currentProgress = $PokemonGlobal.rewardTrackContest.length
    totalPokes = $PokemonGlobal.rewardTrackContest.length + $PokemonGlobal.pokemonListContest.length
    pbSEPlay("NEWAchievedPLA")
    pbMessage(_INTL("\\tg[Arceus]That is correct. You've now registered {1} species out of {2}.", currentProgress, totalPokes))
    getRewards
    if currentProgress == totalPokes
      pbMessage(_INTL("\\tg[Arceus](...)"))
      pbMessage(_INTL("\\tg[Arceus]And here I thought... I was the most bored of them all..."))
      pbMessage(_INTL("\\tg[Arceus]Very well. I'll reset your progress so we can keep playing forever. Hahahahaha..."))
      $PokemonGlobal.lastRewardPercent = 0.0
      $PokemonGlobal.rewardTrackContest = []
      $PokemonGlobal.pokemonListContest = []
      GameData::Species.each do |species|
        next if species.form != 0
        $PokemonGlobal.pokemonListContest << species
      end
    end
    pbMessage(_INTL("\\tg[Arceus]Let's move on to the next one."))
    refillHearts
    @chooseSpecies = $PokemonGlobal.pokemonListContest.sample
    echoln @chooseSpecies.name
    @picks = []
    @picks.push(CONTEST_STUFFS_TO_ASK.sample)
    tip_text = getSpeciesDataContest(@chooseSpecies, @picks[0], true)
    changesprite("arcy", "arcy_shrug")
    pbMessage(_INTL("\\tg[Arceus]" + tip_text))
    changesprite("arcy", "arcy_normal")
    addTips
  end

  def noMoreLives?
    return @currentlives <= 0
  end

  def lastLive?
    return @currentlives == 1
  end

  def getSpeciesDataContest(species, question, arcyText = false)
    text = ""
    case question
    when :height
      if arcyText
        if System.user_language[3..4] == "US"   # If the user is in the United States
          inches = (species.height / 0.254).round
          feet = inches / 12
          inches_remainder = inches % 12
          text = _INTL("Verily, 'tis a Pokémon of {1} foot and {2} inches in stature.", feet, inches_remainder)
        else
          text = _INTL("Lo, it doth stand at {1} meters tall.", species.height / 10.0)
        end
      else
        if System.user_language[3..4] == "US"
          inches = (species.height / 0.254).round
          text = _ISPRINTF("It's {1:d}'{2:02d}\" tall.", inches / 12, inches % 12)
        else
          text = _INTL("It's {1} m tall.", species.height / 10.0)
        end
      end
    when :weight
      if arcyText
        if System.user_language[3..4] == "US"
          pounds = (species.weight / 0.45359).round
          text = _INTL("Its weight doth approximate {1} pounds.", pounds / 10.0)
        else
          text = _INTL("Its weight doth be around {1} kilograms.", species.weight / 10.0)
        end
      else
        if System.user_language[3..4] == "US"
          pounds = (species.weight / 0.45359).round
          text = _INTL("Its weight is around {1} lbs.", pounds / 10.0)
        else
          text = _INTL("Its weight is around {1} kg.", species.weight / 10.0)
        end
      end
    when :color
      if arcyText
        text = _INTL("Its hue be {1}, fair and true.", species.color)
      else
        text = _INTL("Its color is {1}.", species.color)
      end
    when :generation
      if arcyText
        text = _INTL("From generation {1} doth it hail.", species.generation)
      else
        text = _INTL("It belongs to gen {1}.", species.generation)
      end
    when :type
      type_name = GameData::Type.get(species.types[0]).name
      if arcyText
        text = _INTL("It wieldeth the {1} type.", type_name)
      else
        text = _INTL("It has the {1} type.", type_name)
      end
    when :letter
      first_letter = species.name[0]
      if arcyText
        text = _INTL("Its name doth commence with the letter {1}.", first_letter)
      else
        text = _INTL("It starts with the {1} letter.", first_letter)
      end
    when :evolve
      can_evolve = species.evolutions.any? { |evo| !evo[3] }
      if arcyText
        if can_evolve
          text = _INTL("This creature hath the power to evolve.")
        else
          text = _INTL("No further evolutions doth it possess.")
        end
      else
        if can_evolve
          text = _INTL("It can evolve.")
        else
          text = _INTL("It does not evolve.")
        end
      end
    when :ability
      ability_name = GameData::Ability.get(species.abilities[0]).name
      if arcyText
        text = _INTL("Mayhap it possesseth the ability {1}.", ability_name)
      else
        text = _INTL("It can have {1}.", ability_name)
      end
    when :stats
      highest_stat = species.base_stats.max_by { |_, v| v }[0]
      stat_name = GameData::Stat.get(highest_stat).name
      if arcyText
        text = _INTL("Lo, its mightiest attribute is {1}.", stat_name)
      else
        text = _INTL("It has very high {1}.", stat_name)
      end
    end
    return text
  end

  def changesprite(sprite, name)
    @sprites[sprite].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/" + name)
    @sprites[sprite].bitmap.play if @sprites[sprite].bitmap.animated?
  end

  def updateHearts
    @lives.times do |i|
      graphic = i < @currentlives ? "life_full" : "life_empty"
      @sprites["heart#{i}"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/" + graphic)
    end
  end

  def setup
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/background")
    @sprites["bg"].visible = false
    @sprites["mallie"] = Sprite.new(@viewport)
    @sprites["mallie"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/mallie_normal")
    @sprites["mallie"].x = 110
    @sprites["mallie"].y = 80
    @sprites["mallie"].visible = false
    @sprites["arcy"] = Sprite.new(@viewport)
    @sprites["arcy"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/arcy_normal")
    @sprites["arcy"].x = 328
    @sprites["arcy"].y = 80
    @sprites["arcy"].visible = false
    @sprites["arcy"].bitmap.play

    @heartPosX = 8
    @heartPosY = 170
    @heartSpace = 32

    @lives.times do |i|
      @sprites["heart#{i}"] = Sprite.new(@viewport)
      @sprites["heart#{i}"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/life_full")
      @sprites["heart#{i}"].x = @heartPosX
      @sprites["heart#{i}"].y = @heartPosY + i * @heartSpace
      @sprites["heart#{i}"].visible = false
    end

    pbSEPlay("NEWCurtain")
    @sprites["curtain0"] = Sprite.new(@viewport)
    @sprites["curtain0"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/curtain")
    @sprites["curtain0"].x = -@sprites["curtain0"].bitmap.width
    @sprites["curtain1"] = Sprite.new(@viewport)
    @sprites["curtain1"].bitmap = pbBitmap("Graphics/Pictures/ArcyContest/curtain")
    @sprites["curtain1"].x = Graphics.width
    @sprites["curtain1"].mirror = true

    @sprites["overlay"] = BitmapSprite.new(Graphics.width, Graphics.height, @viewport)
    pbSetSystemFont(@sprites["overlay"].bitmap)

    pbBGMFade(1.0)
    @tweener.add(MoveTween.new(@sprites["curtain0"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(MoveTween.new(@sprites["curtain1"], Graphics.width - @sprites["curtain1"].bitmap.width, 0, 1)).set_ease(Ease::OUT_CUBIC)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end

    @sprites["bg"].visible = true
    @sprites["mallie"].visible = true
    @sprites["arcy"].visible = true
    @lives.times do |i|
      @sprites["heart#{i}"].visible = true
    end
    pbWait(0.8)

    @tweener.add(MoveTween.new(@sprites["curtain0"], -@sprites["curtain0"].bitmap.width, 0, 1)).set_ease(Ease::IN_CUBIC)
    @tweener.add(MoveTween.new(@sprites["curtain1"], Graphics.width, 0, 1)).set_ease(Ease::IN_CUBIC)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end

    pbBGMPlay("ContestTheme")

    changesprite("mallie", "mallie_surprise")
    @sprites["mallie"].mirror = true
    pbWait(0.2)
    @sprites["mallie"].mirror = false
    pbWait(0.2)
    @sprites["mallie"].mirror = true
    pbWait(0.2)
    @sprites["mallie"].mirror = false
    pbWait(0.2)
    changesprite("mallie", "mallie_normal")
    pbWait(0.4)

    intro if !@tutorial

    tip_text = getSpeciesDataContest(@chooseSpecies, @picks[0], true)
    changesprite("arcy", "arcy_shrug")
    pbMessage(_INTL("\\tg[Arceus]" + tip_text))
    changesprite("arcy", "arcy_normal")
    
    addTips
    pick_question
  end

  def refillHearts
    echoln "refilling hearts"
    @lives.times do |i|
      @tweener.add(MoveTween.new(@sprites["heart#{i}"], -@sprites["heart#{i}"].bitmap.width, @heartPosY + i * @heartSpace, 1)).set_ease(Ease::IN_CUBIC)
    end
    while !@tweener.isDone?
      @tweener.update
      Graphics.update
    end
    @currentlives = 5
    updateHearts
    @lives.times do |i|
      @tweener.add(MoveTween.new(@sprites["heart#{i}"], @heartPosX, @heartPosY + i * @heartSpace, 1)).set_ease(Ease::OUT_CUBIC)
    end
    while !@tweener.isDone?
      @tweener.update
      Graphics.update
    end
    echoln "finishing refilling hearts"
  end
  
  def addTips(tip = :color)
    @tweener.add(OpacityTween.new(@sprites["overlay"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end

    @sprites["overlay"].bitmap.clear
    textpos = []
    base_color   = Color.new(255, 255, 255, 255)
    shadow_color = Color.new(0, 0, 0, 100)
    currentX = 2
    currentY = 2
    line_height = 32

    @picks.each_with_index do |tip_type, i|
      tip_text = getSpeciesDataContest(@chooseSpecies, tip_type)
      x = (i % 2 == 1) ? Graphics.width : currentX
      align = (i % 2 == 1) ? :right : :left
      textpos.push([tip_text, x, currentY, align, base_color, shadow_color, true])
      currentY += line_height if i % 2 == 1
    end

    pbDrawTextPositions(@sprites["overlay"].bitmap, textpos)

    @tweener.add(OpacityTween.new(@sprites["overlay"], 255, 0.3)).set_ease(Ease::IN_OUT_SINE)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end

    pbWait(0.2)
  end

  def intro
    changesprite("arcy", "arcy_shrug")
    pbMessage(_INTL("\\tg[Arceus]Very well... Let us play a little game."))
    pbMessage(_INTL("\\tg[Arceus]I shall think of a Pokémon... any one that exists, without exception."))
    pbMessage(_INTL("\\tg[Arceus]Then, I will give you a clue. It could be anything: its color, type, height, weight... anything at all."))
    changesprite("arcy", "arcy_normal")
    pbMessage(_INTL("\\tg[Arceus]After that, you'll be able to ask me a few questions. I'll answer them honestly, and you'll need to guess which Pokémon I was thinking of."))
    pbMessage(_INTL("\\tg[Arceus]Each question you ask, or each wrong guess, will cost you a heart."))
    pbMessage(_INTL("\\tg[Arceus]Once a Pokémon has been guessed, I won't pick it again."))
    pbMessage(_INTL("\\tg[Arceus]I shall keep track of how many you correctly identify and reward you accordingly."))
    changesprite("arcy", "arcy_shrug")
    pbMessage(_INTL("\\tg[Arceus]Now then... shall we begin?"))
    changesprite("arcy", "arcy_normal")
    $game_switches[CONTEST_TUTORIAL_SWITCH] = true if !$game_switches[CONTEST_TUTORIAL_SWITCH]
  end

  def dispose
    pbBGMFade(1.0)
    pbWait(1.0)
    pbFadeOutAndHide(@sprites)
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
    pbBGMPlay(@playingBGM)
  end
end