#===============================================================================
#
#===============================================================================
class PokemonLoadPanel < Sprite
  attr_reader :selected

  TEXT_COLOR               = Color.new(232, 232, 232)
  TEXT_SHADOW_COLOR        = Color.new(0, 0, 0)
  MALE_TEXT_COLOR          = Color.new(56, 160, 248)
  MALE_TEXT_SHADOW_COLOR   = Color.new(56, 104, 168)
  FEMALE_TEXT_COLOR        = Color.new(240, 72, 88)
  FEMALE_TEXT_SHADOW_COLOR = Color.new(160, 64, 64)

  def initialize(index, title, isContinue, trainer, stats, mapid, viewport = nil)
    super(viewport)
    @index = index
    @title = title
    @isContinue = isContinue
    @trainer = trainer
    @totalsec = stats&.play_time.to_i || 0
    @mapid = mapid
    @selected = (index == 0)
    @bgbitmap = AnimatedBitmap.new("Graphics/UI/Load/panelsNEW")
    @refreshBitmap = true
    @refreshing = false
    refresh
  end

  def dispose
    @bgbitmap.dispose
    self.bitmap.dispose
    super
  end

  def selected=(value)
    return if @selected == value
    @selected = value
    @refreshBitmap = true
    refresh
  end

  def pbRefresh
    @refreshBitmap = true
    refresh
  end

  def refresh
    return if @refreshing
    return if disposed?
    @refreshing = true
    if !self.bitmap || self.bitmap.disposed?
      self.bitmap = Bitmap.new(@bgbitmap.width, 222)
      pbSetSystemFont(self.bitmap)
    end
    if @refreshBitmap
      @refreshBitmap = false
      self.bitmap&.clear
      if @isContinue
        self.bitmap.blt(0, 0, @bgbitmap.bitmap, Rect.new(0, (@selected) ? 46 : 0, @bgbitmap.width, 46))
      else
        self.bitmap.blt(0, 0, @bgbitmap.bitmap, Rect.new(0, 92 + ((@selected) ? 46 : 0), @bgbitmap.width, 46))
      end
      textpos = []
=begin
      if @isContinue
        textpos.push([@title, 32, 16, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        # textpos.push([_INTL("Badges:"), 32, 118, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        # textpos.push([@trainer.badge_count.to_s, 206, 118, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        # textpos.push([_INTL("Pokédex:"), 32, 150, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        # textpos.push([@trainer.pokedex.seen_count.to_s, 206, 150, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])

        textpos.push([_INTL("Time:"), 32, 182, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        hour = @totalsec / 60 / 60
        min  = @totalsec / 60 % 60
        if hour > 0
          textpos.push([_INTL("{1}h {2}m", hour, min), 206, 182, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        else
          textpos.push([_INTL("{1}m", min), 206, 182, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
        end
        if @trainer.male?
          textpos.push([@trainer.name, 112, 70, :left, MALE_TEXT_COLOR, MALE_TEXT_SHADOW_COLOR])
        elsif @trainer.female?
          textpos.push([@trainer.name, 112, 70, :left, FEMALE_TEXT_COLOR, FEMALE_TEXT_SHADOW_COLOR])
        else
          textpos.push([@trainer.name, 112, 70, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
        end
        mapname = pbGetMapNameFromId(@mapid)
        mapname.gsub!(/\\PN/, @trainer.name)
        textpos.push([mapname, 386, 16, :right, TEXT_COLOR, TEXT_SHADOW_COLOR])
      else
        textpos.push([@title, 32, 14, :left, TEXT_COLOR, TEXT_SHADOW_COLOR])
      end
=end
      textpos.push([@title, 112, 14, :center, TEXT_COLOR, TEXT_SHADOW_COLOR])
      pbDrawTextPositions(self.bitmap, textpos)
    end
    @refreshing = false
  end
end

#===============================================================================
#
#===============================================================================

LOAD_UI_X = 64 # elena

class PokemonLoad_Scene
  def pbStartScene(commands, show_continue, trainer, stats, map_id)
    @commands = commands
    @sprites = {}
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99998
    @tweener = Tweener.new

    @clock = ["day", "dusk", "night"].sample
    # @clock = "night"

    addBackgroundOrColoredPlane(@sprites, "background", "Load/sky_#{@clock}", Color.new(248, 248, 248), @viewport)

    cloud_bitmap = pbBitmap("Graphics/UI/Load/clouds_#{@clock}")

    double_bitmap = Bitmap.new(cloud_bitmap.width * 2, cloud_bitmap.height)
    double_bitmap.blt(0, 0, cloud_bitmap, cloud_bitmap.rect)
    double_bitmap.blt(cloud_bitmap.width, 0, cloud_bitmap, cloud_bitmap.rect)

    @sprites["clouds"] = Sprite.new(@viewport)
    @sprites["clouds"].bitmap = double_bitmap
    @sprites["clouds"].x = 0
    @sprites["clouds"].y = 0

    @sprites["background_chara"] = Sprite.new(@viewport)
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/dragonite")
    @sprites["background_chara"].x = Graphics.width

    @sprites["bricks"] = Sprite.new(@viewport)
    @sprites["bricks"].bitmap = pbBitmap("Graphics/UI/Load/bricks_#{@clock}")
    @sprites["bricks"].y = Graphics.height

    @sprites["arcy"] = Sprite.new(@viewport)
    @sprites["arcy"].bitmap = pbBitmap("Graphics/UI/Load/arcy_idle_#{@clock}")
    @sprites["arcy"].bitmap.play if @sprites["arcy"].bitmap.animated?
    @sprites["arcy"].bitmap.frame_rate = 6
    @sprites["arcy"].y = Graphics.height

    @sprites["arcy_pet"] = Sprite.new(@viewport)
    @sprites["arcy_pet"].bitmap = pbBitmap("Graphics/UI/Load/arcy_pet")
    @sprites["arcy_pet"].visible = false

    @sprites["arcy_pet_alt"] = Sprite.new(@viewport)
    @sprites["arcy_pet_alt"].bitmap = pbBitmap("Graphics/UI/Load/arcy_pet_alt")
    @sprites["arcy_pet_alt"].visible = false

    @sprites["arcy_spot"] = Sprite.new(@viewport)
    @sprites["arcy_spot"].bitmap = pbBitmap("Graphics/UI/Load/arcy_spot_#{@clock}")
    @sprites["arcy_spot"].bitmap.frame_rate = 6
    @sprites["arcy_spot"].bitmap.play
    @sprites["arcy_spot"].visible = false

    @sprites["arcy_spot_alt"] = Sprite.new(@viewport)
    @sprites["arcy_spot_alt"].bitmap = pbBitmap("Graphics/UI/Load/arcy_spot_alt_#{@clock}")
    @sprites["arcy_spot_alt"].visible = false

    @sprites["mouse"] = Sprite.new(@viewport)
    @sprites["mouse"].bitmap = pbBitmap("Graphics/UI/Load/hand1")
    @sprites["mouse"].visible = false

    @sprites["overlay"] = Sprite.new(@viewport)
    @sprites["overlay"].bitmap = pbBitmap("Graphics/UI/Load/overlay")
    @sprites["overlay"].opacity = 0
    @sprites["overlay"].x = Graphics.width
    
    @sprites["logo"] = Sprite.new(@viewport)
    @sprites["logo"].bitmap = pbBitmap("Graphics/UI/Load/logo")
    @sprites["logo"].x = 400
    @sprites["logo"].y = 18
    @sprites["logo"].opacity = 0

    @petTime = 0
    @arcy_state ||= :idle
    @arcy_timer ||= 800
    @character_run = false

    charas = [:dragonite, :mewtwo, :chumi, :balloon, :gilipollas, :pelipper]
    charas.delete(:chumi) if @clock == "night"
    @pick = charas.sample

    case @pick
    when :dragonite
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/dragonite")
    when :mewtwo
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/mewtwo")
    when :chumi
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/shaymin")
    when :balloon
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/balloon")
    when :gilipollas
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/cramorant")
    when :pelipper
    @sprites["background_chara"].bitmap = pbBitmap("Graphics/UI/Load/pelipper")
    end

    @sprites["background_chara"].bitmap.play if @sprites["background_chara"].bitmap.animated?
    @sprites["background_chara"].bitmap.frame_rate = 6

    x = Graphics.width#324 + LOAD_UI_X
    y = 172
    commands.length.times do |i|
      @sprites["panel#{i}"] = PokemonLoadPanel.new(
        i, commands[i], (show_continue) ? (i == 0) : false, trainer, stats, map_id, @viewport
      )
      @sprites["panel#{i}"].x = x
      @sprites["panel#{i}"].y = y
      @sprites["panel#{i}"].pbRefresh

      @tweener.add(MoveTween.new(@sprites["panel#{i}"], 324 + LOAD_UI_X, y, 1)).set_ease(Ease::OUT_CUBIC)
      x += @sprites["panel#{i}"].bitmap.width
      y += 56 # (show_continue && i == 0) ? 64 : 56
    end

    @tweener.add(MoveTween.new(@sprites["overlay"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(OpacityTween.new(@sprites["overlay"], 255, 1)).set_ease(Ease::OUT_SINE)
    @tweener.add(MoveTween.new(@sprites["arcy"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(MoveTween.new(@sprites["bricks"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(OpacityTween.new(@sprites["logo"], 255, 1)).set_ease(Ease::OUT_SINE)

    @sprites["cmdwindow"] = Window_CommandPokemon.new([])
    @sprites["cmdwindow"].viewport = @viewport
    @sprites["cmdwindow"].visible  = false

    pbBGMPlay("TitleScreen")
  end

  def pbStartScene2
    pbFadeInAndShow(@sprites) { pbUpdate }
  end

  def pbStartDeleteScene
    @sprites = {}
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99998
    addBackgroundOrColoredPlane(@sprites, "background", "Load/sky_day", Color.new(248, 248, 248), @viewport)
  end

  def moveCharacter
    return if !@character_run

    sprite = @sprites["background_chara"]

    sprite.y = 10
    sprite.x -= 1

    if sprite.x <= -sprite.bitmap.width
      sprite.x = Graphics.width
      @character_run = false
    end
  end

  def updateBackground
    @cloud_x ||= 0.0
    @cloud_x -= 0.25
    @sprites["clouds"].x = @cloud_x.to_i
    if @cloud_x <= -@sprites["clouds"].bitmap.width / 2
      @cloud_x = 0.0
    end
    arcyMoveLogic
    moveCharacter
  end

  def arcyMoveLogic
    sprite = @sprites["arcy"]
    return unless sprite
    @character_run = true if @arcy_timer <= 250 && @arcy_state == :idle
    case @arcy_state
    when :idle
      @arcy_timer -= 1
      if sprite.bitmap.frame_rate != 6
        sprite.bitmap = pbBitmap("Graphics/UI/Load/arcy_idle_#{@clock}")
        sprite.bitmap.play
        sprite.bitmap.frame_rate = 6

        # this too
        @sprites["arcy_spot"].bitmap.frame_rate = 6
        @sprites["arcy_spot"].bitmap.play
      end
      if @arcy_timer <= 0
        sprite.bitmap = pbBitmap("Graphics/UI/Load/arcy_move_#{@clock}")
        sprite.bitmap.play
        sprite.bitmap.frame_rate = 12
        sprite.bitmap.goto_and_play(0)
        sprite.bitmap.looping = false
        @arcy_state = :move
      end
    when :move
      if !sprite.bitmap.playing
        @arcy_timer = 400
        @arcy_state = :idle_alt
      end
    when :idle_alt
      @arcy_timer -= 1
      if sprite.bitmap.frame_rate != 6
        sprite.bitmap = pbBitmap(filename = "Graphics/UI/Load/arcy_idle_alt_#{@clock}")
        sprite.bitmap.play
        sprite.bitmap.frame_rate = 6
      end
      if @arcy_timer <= 0
        sprite.bitmap = pbBitmap("Graphics/UI/Load/arcy_move_back_#{@clock}")
        sprite.bitmap.play
        sprite.bitmap.frame_rate = 12
        sprite.bitmap.goto_and_play(0)
        sprite.bitmap.looping = false
        @arcy_state = :move_back
      end
    when :move_back
      if !sprite.bitmap.playing
        @arcy_timer = 800
        @character_timer = @arcy_timer
        @arcy_state = :idle
      end
    end
  end

  def arcyAmie
    arcy_pet     = @sprites["arcy_pet"]
    arcy_pet_alt = @sprites["arcy_pet_alt"]
    mouse        = @sprites["mouse"]
    spot         = @sprites["arcy_spot"]
    spot_alt     = @sprites["arcy_spot_alt"]

    if (overPixel?(arcy_pet) || overPixel?(arcy_pet_alt)) && @arcy_state == :idle
      mouse.x = Input.mouse_x - mouse.bitmap.width / 2
      mouse.y = Input.mouse_y - mouse.bitmap.height / 2
      mouse.visible = true

      if Input.press?(Input::MOUSELEFT)
        if (Time.now.to_f - @petTime.to_f) > getPlayTime("Audio/SE/NEWPet.ogg")
          if overPixel?(arcy_pet)
            spot.visible = true
            pbSEPlay("NewPet.ogg", 50, 80)
          else
            spot_alt.visible = true
            pbSEPlay("NewPet.ogg", 90, 150)
          end
          @petTime = Time.now
        end
        if @last_mouse_bitmap != :hand1
          mouse.bitmap = pbBitmap("Graphics/UI/Load/hand1")
          @last_mouse_bitmap = :hand1
        end
      else
        if @last_mouse_bitmap != :hand2
          mouse.bitmap = pbBitmap("Graphics/UI/Load/hand2")
          @last_mouse_bitmap = :hand2
        end
      end
    else
      spot.visible = false if spot.visible
      spot_alt.visible = false if spot_alt.visible
      mouse.visible = false if mouse.visible
    end
  end

  def pbUpdate

    if @tweener.isDone?
      arcyAmie
    else
      @tweener.update
    end
    updateBackground


    oldi = @sprites["cmdwindow"].index rescue 0
    pbUpdateSpriteHash(@sprites)
    newi = @sprites["cmdwindow"].index rescue 0
    if oldi != newi
      @sprites["panel#{oldi}"].selected = false
      @sprites["panel#{oldi}"].pbRefresh
      @sprites["panel#{newi}"].selected = true
      @sprites["panel#{newi}"].pbRefresh
      while @sprites["panel#{newi}"].y > Graphics.height - 80
        @commands.length.times do |i|
          @sprites["panel#{i}"].y -= 48
        end
        6.times do |i|
          break if !@sprites["party#{i}"]
          @sprites["party#{i}"].y -= 48
        end
        @sprites["player"].y -= 48 if @sprites["player"]
      end
      while @sprites["panel#{newi}"].y < 32
        @commands.length.times do |i|
          @sprites["panel#{i}"].y += 48
        end
        6.times do |i|
          break if !@sprites["party#{i}"]
          @sprites["party#{i}"].y += 48
        end
        @sprites["player"].y += 48 if @sprites["player"]
      end
    end
  end

  def pbSetParty(trainer)
    return if !trainer || !trainer.party
    meta = GameData::PlayerMetadata.get(trainer.character_ID)
    if meta
      filename = pbGetPlayerCharset(meta.walk_charset, trainer, true)
      @sprites["player"] = TrainerWalkingCharSprite.new(filename, @viewport)
      if !@sprites["player"].bitmap
        raise _INTL("Player character {1}'s walking charset was not found (filename: \"{2}\").", trainer.character_ID, filename)
      end
      charwidth  = @sprites["player"].bitmap.width
      charheight = @sprites["player"].bitmap.height
      @sprites["player"].x = 112 - (charwidth / 8) + LOAD_UI_X
      @sprites["player"].y = 112 - (charheight / 8)
      @sprites["player"].z = 99999
    end
    trainer.party.each_with_index do |pkmn, i|
      @sprites["party#{i}"] = PokemonIconSprite.new(pkmn, @viewport)
      @sprites["party#{i}"].setOffset(PictureOrigin::CENTER)
      @sprites["party#{i}"].x = 334 + (66 * (i % 2)) + LOAD_UI_X
      @sprites["party#{i}"].y = 112 + (50 * (i / 2))
      @sprites["party#{i}"].z = 99999
    end
  end

  def pbChoose(commands)
    @sprites["cmdwindow"].commands = commands
    loop do
      Graphics.update
      Input.update
      pbUpdate
      if Input.trigger?(Input::USE)
        return @sprites["cmdwindow"].index
      end
    end
  end

  def pbEndScene
    pbFadeOutAndHide(@sprites) { pbUpdate }
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

  def pbCloseScene
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end

#===============================================================================
#
#===============================================================================
class PokemonLoadScreen
  def initialize(scene)
    @scene = scene
    if SaveData.exists?
      @save_data = load_save_file(SaveData::FILE_PATH)
    else
      @save_data = {}
    end
  end

  # @param file_path [String] file to load save data from
  # @return [Hash] save data
  def load_save_file(file_path)
    save_data = SaveData.read_from_file(file_path)
    unless SaveData.valid?(save_data)
      if File.file?(file_path + ".bak")
        pbMessage(_INTL("The save file is corrupt. A backup will be loaded."))
        save_data = load_save_file(file_path + ".bak")
      else
        self.prompt_save_deletion
        return {}
      end
    end
    return save_data
  end

  # Called if all save data is invalid.
  # Prompts the player to delete the save files.
  def prompt_save_deletion
    pbMessage(_INTL("The save file is corrupt, or is incompatible with this game.") + "\1")
    exit unless pbConfirmMessageSerious(
      _INTL("Do you want to delete the save file and start anew?")
    )
    self.delete_save_data
    $game_system   = Game_System.new
    $PokemonSystem = PokemonSystem.new
  end

  def pbStartDeleteScreen
    @scene.pbStartDeleteScene
    @scene.pbStartScene2
    if SaveData.exists?
      if pbConfirmMessageSerious(_INTL("Delete all saved data?"))
        pbMessage(_INTL("Once data has been deleted, there is no way to recover it.") + "\1")
        if pbConfirmMessageSerious(_INTL("Delete the saved data anyway?"))
          pbMessage(_INTL("Deleting all data. Don't turn off the power.") + "\\wtnp[0]")
          self.delete_save_data
        end
      end
    else
      pbMessage(_INTL("No save file was found."))
    end
    @scene.pbEndScene
    $scene = pbCallTitle
  end

  def delete_save_data
    begin
      SaveData.delete_file
      pbMessage(_INTL("The saved data was deleted."))
    rescue SystemCallError
      pbMessage(_INTL("All saved data could not be deleted."))
    end
  end

  def pbStartLoadScreen
    if $DEBUG && !FileTest.exist?("Game.rgssad") && Settings::SKIP_CONTINUE_SCREEN
      if @save_data.empty?
        Game.start_new
      else
        Game.load(@save_data)
      end
      return
    end
    commands = []
    cmd_continue     = -1
    cmd_new_game     = -1
    cmd_options      = -1
    cmd_language     = -1
    cmd_mystery_gift = -1
    cmd_debug        = -1
    cmd_quit         = -1
    show_continue = !@save_data.empty?
    if show_continue
      commands[cmd_continue = commands.length] = _INTL("Continue")
      if @save_data[:player].mystery_gift_unlocked
        commands[cmd_mystery_gift = commands.length] = _INTL("Mystery Gift")
      end
    end
    commands[cmd_new_game = commands.length]  = _INTL("New Game")
    commands[cmd_options = commands.length]   = _INTL("Options")
    commands[cmd_language = commands.length]  = _INTL("Language")# if Settings::LANGUAGES.length >= 2
    # commands[cmd_debug = commands.length]     = _INTL("Debug") if $DEBUG
    commands[cmd_quit = commands.length]      = _INTL("Quit Game")
    map_id = show_continue ? @save_data[:map_factory].map.map_id : 0
    @scene.pbStartScene(commands, show_continue, @save_data[:player], @save_data[:stats], map_id)
    #@scene.pbSetParty(@save_data[:player]) if show_continue
    @scene.pbStartScene2
    loop do
      command = @scene.pbChoose(commands)
      pbSEPlay("NEWCelesticaFlute") if command != cmd_quit
      case command
      when cmd_continue
        @scene.pbEndScene
        Game.load(@save_data)
        return
      when cmd_new_game
        @scene.pbEndScene
        Game.start_new
        return
      when cmd_mystery_gift
        pbFadeOutIn { pbDownloadMysteryGift(@save_data[:player]) }
      when cmd_options
        pbFadeOutIn do
          scene = PokemonOption_Scene.new
          screen = PokemonOptionScreen.new(scene)
          screen.pbStartScreen(true)
        end
      when cmd_language
        @scene.pbEndScene
        $PokemonSystem.language = pbChooseLanguage
        MessageTypes.load_message_files(Settings::LANGUAGES[$PokemonSystem.language][1])
        if show_continue
          @save_data[:pokemon_system] = $PokemonSystem
          File.open(SaveData::FILE_PATH, "wb") { |file| Marshal.dump(@save_data, file) }
        end
        $scene = pbCallTitle
        return
      when cmd_debug
        pbFadeOutIn { pbDebugMenu(false) }
      when cmd_quit
        pbPlayCloseMenuSE
        @scene.pbEndScene
        $scene = nil
        return
      else
        pbPlayBuzzerSE
      end
    end
  end
end
