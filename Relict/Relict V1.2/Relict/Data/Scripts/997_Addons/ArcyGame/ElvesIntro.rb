class ElvesIntro
  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @tweener = Tweener.new
    setup
  end

  def setup
    @sprites["bg"] = Sprite.new(@viewport)
    pick = TILESETS_TEMPLATES_BATTLEBACK.values.find { |entry| entry[1] == $game_map.tileset_name }
    bgname = pick[2]
    @sprites["bg"].bitmap = pbBitmap("Graphics/Battlebacks/" + bgname + "_bg") 
    @sprites["mesprit"] = Sprite.new(@viewport)
    @sprites["mesprit"].bitmap = pbBitmap("Graphics/Pictures/IntroElves/mesprit")
    @sprites["mesprit"].zoom_x = 2; @sprites["mesprit"].zoom_y = 2
    @sprites["mesprit"].y = -@sprites["mesprit"].bitmap.height * 2
    # @sprites["mesprit"].bitmap.frame_rate = 30
    @sprites["mesprit"].bitmap.play
    @sprites["arcy"] = Sprite.new(@viewport)
    @sprites["arcy"].bitmap = pbBitmap("Graphics/Pictures/IntroElves/arcy")
    @sprites["arcy"].zoom_x = 2; @sprites["arcy"].zoom_y = 2
    @sprites["uxie"] = Sprite.new(@viewport)
    @sprites["uxie"].bitmap = pbBitmap("Graphics/Pictures/IntroElves/uxie")
    @sprites["uxie"].y = -@sprites["uxie"].bitmap.height * 2
    @sprites["uxie"].zoom_x = 2; @sprites["uxie"].zoom_y = 2
    @sprites["azelf"] = Sprite.new(@viewport)
    @sprites["azelf"].bitmap = pbBitmap("Graphics/Pictures/IntroElves/azelf")
    @sprites["azelf"].y = @sprites["azelf"].bitmap.height * 2
    @sprites["azelf"].zoom_x = 2; @sprites["azelf"].zoom_y = 2

    pbFadeInAndShow(@sprites)
    pbWait(0.6)

    pbSEPlay("NEWTransform")
    @tweener.add(MoveTween.new(@sprites["mesprit"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end

    pbSEPlay("NEWTransform")
    @tweener.add(MoveTween.new(@sprites["uxie"], 0, 0, 1)).set_ease(Ease::OUT_CUBIC)
    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end
    @sprites["uxie"].bitmap.play

    pbWait(2)
    pbSEPlay("NEWTransform")
    azelfHeight = -(@sprites["azelf"].bitmap.height * 2 - Graphics.height)
    @tweener.add(MoveTween.new(@sprites["azelf"], 0, azelfHeight, 0.2)).set_ease(Ease::OUT_CUBIC)

    while !@tweener.isDone?
        @tweener.update
        Graphics.update
    end
    @sprites["azelf"].bitmap.play

    last_frame = nil
    frame_count = 0

    while frame_count < 200
        frame = @sprites["azelf"].bitmap.current_frame

        if (frame == 11 || frame == 15) && frame != last_frame
            pbSEPlay("NEWBlink")
        end

        last_frame = frame
        Graphics.update
        frame_count += 1
    end

    dispose
  end

  def dispose
    pbFadeOutAndHide(@sprites)
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end