# stuff to look for: battler.pbHasType?($PokemonGlobal.battlePlates) # arcy
# and type == $PokemonGlobal.battlePlates && user.index.even? # arcy

PLATE_TYPES = {
    :FISTPLATE   => :FIGHTING,
    :SKYPLATE    => :FLYING,
    :TOXICPLATE  => :POISON,
    :EARTHPLATE  => :GROUND,
    :STONEPLATE  => :ROCK,
    :INSECTPLATE => :BUG,
    :SPOOKYPLATE => :GHOST,
    :IRONPLATE   => :STEEL,
    :FLAMEPLATE  => :FIRE,
    :SPLASHPLATE => :WATER,
    :MEADOWPLATE => :GRASS,
    :ZAPPLATE    => :ELECTRIC,
    :MINDPLATE   => :PSYCHIC,
    :ICICLEPLATE => :ICE,
    :DRACOPLATE  => :DRAGON,
    :DREADPLATE  => :DARK,
    :PIXIEPLATE  => :FAIRY,
    :BLANKPLATE  => :NORMAL,
}

class PokemonGlobalMetadata
    attr_accessor :battlePlates
    attr_accessor :battlePlatesUses
    attr_accessor :battlePlatesMaxUses
    attr_accessor :angeryArcy
  
    def battlePlates
      return @battlePlates || nil
    end

    def battlePlatesUses
      return @battlePlatesUses || 2
    end

    def battlePlatesMaxUses
      return @battlePlatesMaxUses || 2
    end

    def angeryArcy
      return @angeryArcy || 0
    end
end

EventHandlers.add(:on_end_battle, :resetArcyEffects,
  proc {
    $PokemonGlobal.battlePlates = nil
    $PokemonGlobal.battlePlatesUses = $PokemonGlobal.battlePlatesMaxUses.dup
    $PokemonGlobal.angeryArcy = 0
  }
)

def shouldShowArcyPlatesIcon
  PLATE_TYPES.each_key do |item|
    return true if $bag.has?(item)
  end
  return false
end

class Battle::Scene
  
  def rewriteArcyPlates(plates, index)
    @plateOverlay.clear

    imagePos = [
        ["Graphics/UI/ArcyTypes/itembg", 0, 0],
        [sprintf("Graphics/Items/%s", plates[index]), 60, 20]
    ]

    textPos = [
        [_INTL("[Cancel: X]"), 84, 4,  :center, Color.new(248, 248, 248), Color.new(0, 0, 0), :outline],
        [_INTL("{1}", GameData::Type.get(PLATE_TYPES[plates[index]]).name), 84, 68,  :center, Color.new(248, 248, 248), Color.new(0, 0, 0), :outline]
    ]
    pbDrawImagePositions(@plateOverlay, imagePos)
    pbDrawTextPositions(@plateOverlay, textPos)
  end

  def exitArcyPlatesMenu
    @plateOverlay.clear
    imagePos = [
    ["Graphics/UI/ArcyTypes/plate_icon", 0, 0]
    ]
    margen = 20
    textPos = [
    [_INTL("[D Key]"), 64, 50,  :left, Color.new(248, 248, 248), Color.new(0, 0, 0), :outline]
    ]
    pbDrawImagePositions(@plateOverlay, imagePos)
    pbDrawTextPositions(@plateOverlay, textPos)
    @sprites["leftarrow"].visible = false
    @sprites["rightarrow"].visible = false
  end

  def pbActivateArcyPlates
    return if @enhancedUIToggle == :move
    pbShowTipCard(:POKEMONTIP1)
    againstArceus = false
    [1, 3].each { |i| againstArceus = true if !@battle.battlers[i].nil? && @battle.battlers[i].isSpecies?(:ARCEUS) }
    
    @sprites["enhancedUIPrompts"].visible = false
    @sprites["commandWindow"].visible = false
    @sprites["fightWindow"].visible = false

    if $PokemonGlobal.battlePlatesUses <= 0
      @sprites["plate"].visible = false
      @battle.scene.pbStartSpeech(1)
      if againstArceus
        Mugshot.load("ArcyLaugh")
        pbMessage(_INTL("\\tg[Arceus]You're on your own now... Hahahahaha..."))
        Mugshot.dispose
      else
        Mugshot.load("ArcyRedFlag")
        pbMessage(_INTL("\\tg[Arceus]All I can offer now is moral support. Go, go..."))
        Mugshot.dispose
      end
      @battle.scene.pbForceEndSpeech
      if Battle::Scene::FIGHT_BOX
        pbShowWindow(FIGHT_BOX)
      else
        pbShowWindow(COMMAND_BOX)
      end
      return
    end

    @sprites["leftarrow"].visible = true
    @sprites["rightarrow"].visible = true
    @sprites["leftarrow"].y = 156
    @sprites["rightarrow"].y = @sprites["leftarrow"].y
    @sprites["leftarrow"].x = 2
    @sprites["rightarrow"].x = 124

    index = 0
    ownedPlates = []
    currentType = $PokemonGlobal.battlePlates.clone

    PLATE_TYPES.each_key do |item|
    ownedPlates.push(item) if $bag.has?(item)
    end

    rewriteArcyPlates(ownedPlates, index)

    loop do
        pbUpdate
        @sprites["leftarrow"].update
        @sprites["rightarrow"].update
        if Input.trigger?(Input::LEFT)
          pbPlayCursorSE
          index -= 1
          index = ownedPlates.length-1 if index < 0
          rewriteArcyPlates(ownedPlates, index)
        elsif Input.trigger?(Input::RIGHT)
          pbPlayCursorSE
          index += 1
          index = 0 if index > ownedPlates.length-1
          rewriteArcyPlates(ownedPlates, index)
        elsif Input.trigger?(Input::BACK)
          pbPlayCloseMenuSE
          exitArcyPlatesMenu
          break
        elsif Input.trigger?(Input::USE)
          pbPlayDecisionSE
          exitArcyPlatesMenu
          $PokemonGlobal.battlePlates = PLATE_TYPES[ownedPlates[index]]
          @sprites["plate"].visible = false
          displayArcyAnim(currentType, $PokemonGlobal.battlePlates)
          if currentType != $PokemonGlobal.battlePlates
            $PokemonGlobal.battlePlatesUses -= 1
            @battle.pbDisplayPaused(_INTL("All {1}-type moves received a +20% damage boost!", GameData::Type.get($PokemonGlobal.battlePlates).name))
            @battle.pbDisplayPaused(_INTL("{1}-type Pokémon now have a 3x catch rate!", GameData::Type.get($PokemonGlobal.battlePlates).name))
            @battle.pbDisplayPaused(_INTL("Remaining uses: {1}", $PokemonGlobal.battlePlatesUses))
          end
          break
        end
    end
    if Battle::Scene::FIGHT_BOX
      pbShowWindow(FIGHT_BOX)
    else
      pbShowWindow(COMMAND_BOX)
    end
  end

  def displayArcyAnim(type0 = nil, type1)
      againstArceus = false
      usedSameType = (type0 == type1) ? true : false
      type0 = :NORMAL if type0.nil?

      [1, 3].each { |i| againstArceus = true if !@battle.battlers[i].nil? && @battle.battlers[i].isSpecies?(:ARCEUS) }

      if againstArceus && !$game_switches[69]
        @battle.scene.pbStartSpeech(1)
        voice("Arcy", :laughAlt)
        Mugshot.load("ArcyMalito")
        pbMessage(_INTL("\\tg[Arceus]Hahaha... Very well! I shall abide by the rules...!"))
        Mugshot.dispose
        @battle.scene.pbForceEndSpeech
        $game_switches[69] = true
      end

      @tweener = Tweener.new
      @sprites["animBG"] = Sprite.new(@viewport)
      @sprites["anim"] = Sprite.new(@viewport)
      @sprites["animAlt0"] = Sprite.new(@viewport)
      @sprites["animAlt1"] = Sprite.new(@viewport)
      @sprites["animPlate"] = Sprite.new(@viewport)
      @sprites["animShine"] = Sprite.new(@viewport)

      @sprites["animBG"].z = 99999
      @sprites["anim"].z = 99999
      @sprites["animAlt0"].z = 99999
      @sprites["animAlt1"].z = 99999
      @sprites["animPlate"].z = 99999
      @sprites["animShine"].z = 99999

      @sprites["animBG"].bitmap = @sprites["battle_bg"].bitmap.clone

      @sprites["anim"].bitmap = Bitmap.new(sprintf("Graphics/UI/ArcyTypes/ArcyAnimation/%s.gif", type0))
      @sprites["anim"].x = Graphics.width
      @sprites["anim"].zoom_x = 2
      @sprites["anim"].zoom_y = 2

      @sprites["animAlt0"].bitmap = Bitmap.new(sprintf("Graphics/UI/ArcyTypes/ArcyAnimation/SHINY_OVERLAY.gif"))
      @sprites["animAlt0"].x = Graphics.width
      @sprites["animAlt0"].zoom_x = 2
      @sprites["animAlt0"].zoom_y = 2
      @sprites["animAlt0"].visible = false # shiny no programado

      if againstArceus
        altGraphic = "ALT_SMILE"
      elsif usedSameType
        altGraphic = "ALT_YEAH"
      else
        altGraphic = "ALT_YEAH"
      end

      @sprites["animAlt1"].bitmap = Bitmap.new(sprintf("Graphics/UI/ArcyTypes/ArcyAnimation/%s.gif", altGraphic))
      @sprites["animAlt1"].x = Graphics.width
      @sprites["animAlt1"].zoom_x = 2
      @sprites["animAlt1"].zoom_y = 2
      @sprites["animAlt1"].visible = (againstArceus || usedSameType) ? true : false

      @sprites["animPlate"].bitmap = Bitmap.new(sprintf("Graphics/UI/ArcyTypes/ArcyAnimation/PLATES/%s.gif", type1))
      @sprites["animPlate"].zoom_x = 2
      @sprites["animPlate"].zoom_y = 2
      @sprites["animPlate"].bitmap.looping = false

      @sprites["animShine"].bitmap = Bitmap.new(sprintf("Graphics/UI/ArcyTypes/ArcyAnimation/EFFECT/%s.gif", type1))
      @sprites["animShine"].zoom_x = 2
      @sprites["animShine"].zoom_y = 2
      @sprites["animShine"].bitmap.looping = false

      anim      = @sprites["anim"]
      plate     = @sprites["animPlate"]
      shine     = @sprites["animShine"]
      alt0      = @sprites["animAlt0"]
      alt1      = @sprites["animAlt1"]

      [anim, alt0, alt1].each do |sprite|
        @tweener.add(MoveTween.new(sprite, 0, 0, 0.6)).set_ease(Ease::OUT_CUBIC)
      end

      played_sound = false
      started_anim = false
      switched_bitmap = false
      moved_offscreen = false
      frame_max = anim.bitmap.frame_count - 8

      loop do
        pbUpdate
        @tweener.update
        break if @tweener.isDone?
      end

      for i in 0...frame_max
        pbUpdate
        pbSEPlay("NEWSentencia1") if i == 8
        if i == 12
          new_path = "Graphics/UI/ArcyTypes/ArcyAnimation/#{type1}.gif"
          anim.bitmap = Bitmap.new(new_path)
        end
        anim.bitmap.goto_and_stop(i)
        alt0.bitmap.goto_and_stop(i)
        alt1.bitmap.goto_and_stop(i)
        plate.bitmap.goto_and_stop(i)
        shine.bitmap.goto_and_stop(i)
        pbWait(0.04)
      end

      [anim, alt0, alt1, plate, shine].each do |sprite|
        @tweener.add(MoveTween.new(sprite, -Graphics.width, 0, 0.6))
                  .set_ease(Ease::IN_CUBIC)
      end

      loop do
        pbUpdate
        @tweener.update
        break if @tweener.isDone?
      end

      @sprites["anim"].dispose
      @sprites["animPlate"].dispose
      @sprites["animShine"].dispose
      @sprites["animAlt0"].dispose
      @sprites["animAlt1"].dispose
      @sprites["animBG"].dispose

      if usedSameType
        $PokemonGlobal.angeryArcy = 2 if againstArceus
        pbWait(0.2)
        @battle.scene.pbStartSpeech(1)
        case $PokemonGlobal.angeryArcy
        when 0
          voice("Arcy", :nod)
          Mugshot.load("ArcyShrug")
          pbMessage(_INTL("\\tg[Arceus]Just so you're aware, these effects won't stack."))
          Mugshot.load("ArcyShrugA")
          pbMessage(_INTL("\\tg[Arceus]Don't make me work unnecessarily."))
          Mugshot.dispose
        when 1
          voice("Arcy", :laugh)
          Mugshot.load("ArcySmile")
          pbMessage(_INTL("\\tg[Arceus]Like I said... this is completely futile."))
          Mugshot.load("ArcySmile")
          pbMessage(_INTL("\\tg[Arceus]You'd be wise to stop that now."))
          Mugshot.dispose
        when 2
          if againstArceus
            Mugshot.load("ArcySmile")
          else
            Mugshot.load("ArcyYeah")
          end
          pbMessage(_INTL("\\tg[Arceus](...)"))
          Mugshot.dispose
        end
        @battle.scene.pbForceEndSpeech
        pbWait(0.2)

        $PokemonGlobal.angeryArcy += 1
        if $PokemonGlobal.angeryArcy > 2
          if $PokemonGlobal.battlePlates.nil?
            @battle.pbDisplayPaused(_INTL("It didn't have any effect..."))
          else
            @battle.pbDisplayPaused(_INTL("All boosts have faded away."))
          end
          $PokemonGlobal.battlePlatesUses = 0
          @battle.pbDisplayPaused(_INTL("Remaining uses: 0"))
        else
          @battle.pbDisplayPaused(_INTL("It didn't have any effect..."))
        end
      end

      if againstArceus && !usedSameType
        [1, 3].each do |i|
          battler = @battle.battlers[i]
          next if battler.nil?
          if battler.isSpecies?(:ARCEUS)
            newForm  = GameData::Type.get(type1).icon_position
            typeName = GameData::Type.get(type1).name
            if battler.form != newForm
              @battle.scene.pbArceusTransform(battler.index, type1)
              battler.pbChangeForm(newForm, _INTL("{1} transformed into the {2} type!", battler.pbThis, typeName))
            end
          end
        end
      end

  end

end