#===============================================================================
#
#===============================================================================
class PokemonPauseMenu_Scene
  def pbStartScene
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @spanish = $PokemonSystem.language == 1 ? "_esp" : ""
    @index    = $game_temp.menu_last_choice
    pbSEPlay("GUI menu open")
    
    @tweener = Tweener.new
    @sprites["bar0"] = Sprite.new(@viewport)
    @sprites["bar1"] = Sprite.new(@viewport)
    @sprites["backRing"] = Sprite.new(@viewport)
    @sprites["chara"] = Sprite.new(@viewport)
    @sprites["frontRing"] = Sprite.new(@viewport)
    @sprites["frontPlates"] = Sprite.new(@viewport)
    @sprites["letters"] = Sprite.new(@viewport)

    @sprites["bar0"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/black_bar"))
    @sprites["bar0"].zoom_x = 2
    @sprites["bar0"].zoom_y = 2
    @sprites["bar0"].y = -@sprites["bar0"].bitmap.height * 2
    @sprites["bar0"].opacity = 160

    @sprites["bar1"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/black_bar"))
    @sprites["bar1"].zoom_x = 2
    @sprites["bar1"].zoom_y = 2
    @sprites["bar1"].y = Graphics.height + @sprites["bar1"].bitmap.height * 2
    @sprites["bar1"].opacity = 160

    @sprites["backRing"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/back_ring.gif"))
    @sprites["backRing"].zoom_x = 2
    @sprites["backRing"].zoom_y = 2
    @sprites["backRing"].visible = $game_switches[60] ? true : false

    filename = $game_switches[60] ? "Graphics/UI/Main Menu/chara1"  : "Graphics/UI/Main Menu/chara0"
    filename = "Graphics/UI/Main Menu/chara2" if $PokemonGlobal.surfing
    @sprites["chara"].bitmap = Bitmap.new(sprintf(filename))
    @sprites["chara"].x = 102
    @sprites["chara"].y = Graphics.height + @sprites["chara"].bitmap.height * 2
    @sprites["chara"].zoom_x = 2
    @sprites["chara"].zoom_y = 2

    @sprites["frontRing"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/front_ring.gif"))
    @sprites["frontRing"].zoom_x = 2
    @sprites["frontRing"].zoom_y = 2
    @sprites["frontRing"].visible = $game_switches[60] ? true : false
    
    @sprites["frontPlates"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/frontPlates.gif"))
    @sprites["frontPlates"].zoom_x = 2
    @sprites["frontPlates"].zoom_y = 2
    @sprites["frontPlates"].opacity = 216.75 # 85%

    @sprites["letters"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/letters" + @spanish))
    @sprites["letters"].opacity = 0
    @sprites["letters"].zoom_x = 2
    @sprites["letters"].zoom_y = 2

    6.times do |i|
      @sprites["button#{i}"] = Sprite.new(@viewport)
      @sprites["button#{i}"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/buttons/button#{i}" + @spanish))
      @sprites["button#{i}"].zoom_x = 2
      @sprites["button#{i}"].zoom_y = 2
      @sprites["button#{i}"].visible = false
    end

    @sprites["button_floor"] = Sprite.new(@viewport)
    @sprites["button_floor"].bitmap = Bitmap.new(sprintf("Graphics/UI/Main Menu/buttons/button_floor" + @spanish))
    @sprites["button_floor"].zoom_x = 2
    @sprites["button_floor"].zoom_y = 2
    @sprites["button_floor"].visible = false

    @sprites["overlay"] = BitmapSprite.new(Graphics.width, Graphics.height, @viewport)
    @sprites["overlay"].bitmap.font.size = 36
    @sprites["overlay"].opacity = 0
    
    backRing = @sprites["backRing"]
    chara = @sprites["chara"]
    frontRing = @sprites["frontRing"]
    frontPlates = @sprites["frontPlates"]
    letters = @sprites["letters"]

    overlay = @sprites["overlay"].bitmap
    pbSetSystemFont(@sprites["overlay"].bitmap)
    base = Color.new(202, 183, 48)
    shadow = Color.new(0, 0, 0)
    floor = $PokemonGlobal.dungeonFloor == 0 ? "?" : $PokemonGlobal.dungeonFloor
    levelcap = getLevelCap
    draw_number(overlay, "Graphics/UI/Main Menu/numbers", floor, 44, 104)
    draw_number(overlay, "Graphics/UI/Main Menu/numbers", levelcap, 54, 180)

    frame_max = backRing.bitmap.frame_count - 6

    # bars
    @tweener.add(MoveTween.new(@sprites["bar0"], 0, 0, 0.3)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(MoveTween.new(@sprites["bar1"], 0, Graphics.height - @sprites["bar1"].bitmap.height * 2, 0.3)).set_ease(Ease::OUT_CUBIC)

    @tweener.add(MoveTween.new(chara, 102, Graphics.height - @sprites["chara"].bitmap.height * 2, 0.3)).set_ease(Ease::OUT_CUBIC)
    @tweener.add(OpacityTween.new(letters, 255, 0.3)).set_ease(Ease::IN_OUT_SINE).set_delay(1)
    @tweener.add(OpacityTween.new(@sprites["overlay"], 255, 0.3)).set_ease(Ease::IN_OUT_SINE).set_delay(1)

    i = 0
    while i < frame_max
      i += 1
      @tweener.update
      Graphics.update
      if i < frame_max
        backRing.bitmap.goto_and_stop(i)
        frontRing.bitmap.goto_and_stop(i)
        frontPlates.bitmap.goto_and_stop(i)
      end
      pbWait(0.005)
    end
    
    @sprites["letters"].visible = false
    @sprites["frontPlates"].visible = false
    6.times do |i|
      @sprites["button#{i}"].visible = true
    end
    @sprites["button_floor"].visible = true

    filename = $game_switches[60] ? "Graphics/Pictures/Menu/chara1"  : "Graphics/Pictures/Menu/chara0"

    update_button
  end

  def draw_number(overlay, image_path, number, x, y)
    digits = number.to_s.chars.map(&:to_i)
    digits.each_with_index do |digit, i|
      src_rect = Rect.new(digit * 20, 0, 20, 30) # 10px wide, 14px tall
      offset_y = i * 4  # Each digit appears 4 pixels lower than the last
      overlay.blt(x + i * 20, y - offset_y, RPG::Cache.load_bitmap("", image_path), src_rect)
    end
  end

  def update_button
    6.times do |i|
      graphic = i == @index ? sprintf("Graphics/UI/Main Menu/buttons/button#{i}_sel" + @spanish) : sprintf("Graphics/UI/Main Menu/buttons/button#{i}" + @spanish)
      @sprites["button#{i}"].bitmap = Bitmap.new(graphic)
      @sprites["button#{i}"].bitmap.play if @sprites["button#{i}"].bitmap.animated?
      @sprites["button#{i}"].bitmap.looping = false if @sprites["button#{i}"].bitmap.animated?
    end
  end

  def pickCommand
    @index    = $game_temp.menu_last_choice
    loop do
      Graphics.update
      Input.update
      pbUpdateSceneMap
      if Input.repeat?(Input::DOWN) || Input.repeat?(Input::LEFT)
        pbPlayCursorSE
        @index += 1
        @index = 0 if @index > 5
        update_button
      elsif Input.repeat?(Input::UP) || Input.repeat?(Input::RIGHT)
        pbPlayCursorSE
        @index -= 1
        @index = 5 if @index < 0
        update_button
      elsif Input.trigger?(Input::BACK) || Input.trigger?(Input::ACTION)
        pbEndScene
        break
      elsif Input.trigger?(Input::USE)
        $game_temp.menu_last_choice = @index
        case @index
        when 0
          if $player.party_count > 0 
            pbFadeOutIn do
              sscene = PokemonParty_Scene.new
              sscreen = PokemonPartyScreen.new(sscene, $player.party)
              sscreen.pbPokemonScreen
            end
          else
            pbMessage(_INTL("You don't have any Pokémon yet."))
          end
        when 1
          pbFadeOutIn do
            scene = PokemonBag_Scene.new
            screen = PokemonBagScreen.new(scene, $bag)
            screen.pbStartScreen
          end
        when 2
          pbFadeOutIn do
            scene = EncounterList_Scene.new
            screen = EncounterList_Screen.new(scene)
            screen.pbStartScreen
          end
        when 3
          scene = PokemonSave_Scene.new
          screen = PokemonSaveScreen.new(scene)
          if screen.pbSaveScreen
            pbEndScene
            break
          end
        when 4
          pbFadeOutIn do
            scene = PokemonOption_Scene.new
            screen = PokemonOptionScreen.new(scene)
            screen.pbStartScreen
            pbUpdateSceneMap
          end
        when 5
          if $player.party_count > 0 
            if pbConfirmMessage(_INTL("Return to the last checkpoint? This will count as a defeat."))
              pbEndScene
              pbStartOver
              break
            end
          else
            pbMessage(_INTL("After getting your first Pokémon, this option will allow you to return to the last checkpoint."))
          end
        end
      end
    end
  end

  def pbEndScene

    @tweener.add(MoveTween.new(@sprites["bar0"], 0, -@sprites["bar0"].bitmap.height * 2, 0.3)).set_ease(Ease::IN_CUBIC)
    @tweener.add(MoveTween.new(@sprites["bar1"], 0, Graphics.height + @sprites["bar1"].bitmap.height * 2, 0.3)).set_ease(Ease::IN_CUBIC)

    @tweener.add(MoveTween.new(@sprites["chara"], 102, Graphics.height + @sprites["chara"].bitmap.height * 2, 0.3)).set_ease(Ease::IN_CUBIC)

    @tweener.add(OpacityTween.new(@sprites["letters"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)
    @tweener.add(OpacityTween.new(@sprites["overlay"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)


    @sprites["letters"].visible = true
    @sprites["frontPlates"].visible = true
    6.times do |i|
      @sprites["button#{i}"].visible = false
    end
    @sprites["button_floor"].visible = false

    backRing = @sprites["backRing"]
    frontRing = @sprites["frontRing"]
    frontPlates = @sprites["frontPlates"]

    if backRing&.bitmap&.frame_count
      frame_max = backRing.bitmap.frame_count - 6
      i = frame_max
      while i > 0
        i -= 1
        @tweener.update
        Graphics.update
        backRing.bitmap.goto_and_stop(i)
        frontRing.bitmap.goto_and_stop(i)
        frontPlates.bitmap.goto_and_stop(i)
        pbWait(0.005)
      end
    end

    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

  def pbRefresh; end
end

#===============================================================================
#
#===============================================================================
class PokemonPauseMenu
  def initialize(scene)
    @scene = scene
  end

  def pbShowMenu
    @scene.pbRefresh
    # @scene.pbShowMenu
  end

  def pbShowInfo; end

  def pbStartPokemonMenu
    if !$player
      if $DEBUG
        pbMessage(_INTL("The player trainer was not defined, so the pause menu can't be displayed."))
        pbMessage(_INTL("Please see the documentation to learn how to set up the trainer player."))
      end
      return
    end
    @scene.pbStartScene
    @scene.pickCommand
  end
end

#===============================================================================
# Pause menu commands.
#===============================================================================
MenuHandlers.add(:pause_menu, :pokedex, {
  "name"      => _INTL("Pokédex"),
  "order"     => 10,
  "condition" => proc { next $player.has_pokedex && $player.pokedex.accessible_dexes.length > 0 },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    if Settings::USE_CURRENT_REGION_DEX
      pbFadeOutIn do
        scene = PokemonPokedex_Scene.new
        screen = PokemonPokedexScreen.new(scene)
        screen.pbStartScreen
        menu.pbRefresh
      end
    elsif $player.pokedex.accessible_dexes.length == 1
      $PokemonGlobal.pokedexDex = $player.pokedex.accessible_dexes[0]
      pbFadeOutIn do
        scene = PokemonPokedex_Scene.new
        screen = PokemonPokedexScreen.new(scene)
        screen.pbStartScreen
        menu.pbRefresh
      end
    else
      pbFadeOutIn do
        scene = PokemonPokedexMenu_Scene.new
        screen = PokemonPokedexMenuScreen.new(scene)
        screen.pbStartScreen
        menu.pbRefresh
      end
    end
    next false
  }
})

MenuHandlers.add(:pause_menu, :party, {
  "name"      => _INTL("Pokémon"),
  "order"     => 20,
  "condition" => proc { next $player.party_count > 0 },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    hidden_move = nil
    pbFadeOutIn do
      sscene = PokemonParty_Scene.new
      sscreen = PokemonPartyScreen.new(sscene, $player.party)
      hidden_move = sscreen.pbPokemonScreen
      (hidden_move) ? menu.pbEndScene : menu.pbRefresh
    end
    next false if !hidden_move
    $game_temp.in_menu = false
    pbUseHiddenMove(hidden_move[0], hidden_move[1])
    next true
  }
})

MenuHandlers.add(:pause_menu, :encounters, {
  "name"      => _INTL("Encounters"),
  "order"     => 25,
  "condition" => proc { next !pbInBugContest? },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      scene = EncounterList_Scene.new
      screen = EncounterList_Screen.new(scene)
      screen.pbStartScreen
      menu.pbRefresh
    end
    next false
  }
})

MenuHandlers.add(:pause_menu, :bag, {
  "name"      => _INTL("Bag"),
  "order"     => 30,
  "condition" => proc { next !pbInBugContest? },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    item = nil
    pbFadeOutIn do
      scene = PokemonBag_Scene.new
      screen = PokemonBagScreen.new(scene, $bag)
      item = screen.pbStartScreen
      (item) ? menu.pbEndScene : menu.pbRefresh
    end
    next false if !item
    $game_temp.in_menu = false
    pbUseKeyItemInField(item)
    next true
  }
})

MenuHandlers.add(:pause_menu, :pokegear, {
  "name"      => _INTL("Pokégear"),
  "order"     => 40,
  "condition" => proc { next $player.has_pokegear },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      scene = PokemonPokegear_Scene.new
      screen = PokemonPokegearScreen.new(scene)
      screen.pbStartScreen
      ($game_temp.fly_destination) ? menu.pbEndScene : menu.pbRefresh
    end
    next pbFlyToNewLocation
  }
})

MenuHandlers.add(:pause_menu, :town_map, {
  "name"      => _INTL("Town Map"),
  "order"     => 40,
  "condition" => proc { next !$player.has_pokegear && $bag.has?(:TOWNMAP) },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      scene = PokemonRegionMap_Scene.new(-1, false)
      screen = PokemonRegionMapScreen.new(scene)
      ret = screen.pbStartScreen
      $game_temp.fly_destination = ret if ret
      ($game_temp.fly_destination) ? menu.pbEndScene : menu.pbRefresh
    end
    next pbFlyToNewLocation
  }
})

MenuHandlers.add(:pause_menu, :trainer_card, {
  "name"      => proc { next $player.name },
  "order"     => 50,
  "condition" => proc { next $player.has_pokegear }, # NEW
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      scene = PokemonTrainerCard_Scene.new
      screen = PokemonTrainerCardScreen.new(scene)
      screen.pbStartScreen
      menu.pbRefresh
    end
    next false
  }
})

MenuHandlers.add(:pause_menu, :save, {
  "name"      => _INTL("Save"),
  "order"     => 60,
  "condition" => proc {
    next $game_system && !$game_system.save_disabled && !pbInSafari? && !pbInBugContest?
  },
  "effect"    => proc { |menu|
    menu.pbHideMenu
    scene = PokemonSave_Scene.new
    screen = PokemonSaveScreen.new(scene)
    if screen.pbSaveScreen
      menu.pbEndScene
      next true
    end
    menu.pbRefresh
    menu.pbShowMenu
    next false
  }
})

MenuHandlers.add(:pause_menu, :options, {
  "name"      => _INTL("Options"),
  "order"     => 70,
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      scene = PokemonOption_Scene.new
      screen = PokemonOptionScreen.new(scene)
      screen.pbStartScreen
      pbUpdateSceneMap
      menu.pbRefresh
    end
    next false
  }
})

MenuHandlers.add(:pause_menu, :debug, {
  "name"      => _INTL("Debug"),
  "order"     => 80,
  "condition" => proc { next $DEBUG },
  "effect"    => proc { |menu|
    pbPlayDecisionSE
    pbFadeOutIn do
      pbDebugMenu
      menu.pbRefresh
    end
    next false
  }
})

MenuHandlers.add(:pause_menu, :quit_game, {
  "name"      => _INTL("Quit to Title"),
  "order"     => 90,
  "effect"    => proc { |menu|
    menu.pbHideMenu
    if pbConfirmMessage(_INTL("Are you sure you want to quit the game?"))
      scene = PokemonSave_Scene.new
      screen = PokemonSaveScreen.new(scene)
      screen.pbSaveScreen
      menu.pbEndScene
      scene = pbCallTitle
      next true
    end
    menu.pbRefresh
    menu.pbShowMenu
    next false
  }
})
