class GivePlateMessage
    def initialize(plate = :ZAPPLATE, translate = true)
        @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
        @viewport.z = 99999
        @sprites = {}
        @tweener = Tweener.new
        @translate = translate
        setup(plate)
    end

    def pick_plate_descriptions(plate = :ZAPPLATE)
        plate_descriptions = {
            BLANKPLATE: _INTL("\"Three beings whose power can hold both time and space fixed.\""),
            FISTPLATE: _INTL("\"The rift is born of disorder on the other side of this world.\""),
            SKYPLATE: _INTL("\"The being poured the remains of its power into stone and buried it deep.\""),
            TOXICPLATE: _INTL("\"The rules of time and space change within the opposite world.\""),
            EARTHPLATE: _INTL("\"When the universe was created, its shards became this Plate.\""),
            STONEPLATE: _INTL("\"It gathers power from the Plates, listening for the flute's song.\""),
            INSECTPLATE: _INTL("\"Where all creation was born, that is the being's place of origin.\""),
            SPOOKYPLATE: _INTL("\"The other side of this world was given by the Original One to its raging third.\""),
            IRONPLATE: _INTL("\"That which fills the other side of the world can shape the rage and mold it.\""),
            FLAMEPLATE: _INTL("\"The power of defeated giants infuses this Plate.\""),
            SPLASHPLATE: _INTL("\"The rightful bearer of a Plate draws from the Plate it holds.\""),
            MEADOWPLATE: _INTL("\"The powers of Plates are shared among Pokémon.\""),
            ZAPPLATE: _INTL("\"The third being raged, raining down bolts of anger.\""),
            MINDPLATE: _INTL("\"The Original One breathed alone before the universe came.\""),
            ICICLEPLATE: _INTL("\"Two beings of time and space set free from the Original One.\""),
            DRACOPLATE: _INTL("\"Three beings were born to bind time and space.\""),
            DREADPLATE: _INTL("\"Two make matter, and three make spirit, shaping the world.\""),
            PIXIEPLATE: _INTL("\"The Original One is in all things. The Original One is nowhere at all.\""),
            LEGENDPLATE: _INTL("\"From all creations, over all creations, does the Original One watch over all.\"")
        }

        return [plate_descriptions[plate.upcase] || _INTL("Unknown Plate")]
    end

    def wait_for_tweens
        while !@tweener.isDone?
            @tweener.update
            Graphics.update
        end
    end

    def setup(plate = :ZAPPLATE)
        @sprites["bg"] = Sprite.new(@viewport)
        @sprites["bg"].bitmap = pbBitmap("Graphics/UI/PlatesInterfaz/black_screen")
        @sprites["bg"].opacity = 0

        @sprites["plate"] = Sprite.new(@viewport)
        @sprites["plate"].bitmap = pbBitmap("Graphics/UI/PlatesInterfaz/#{plate}")
        margen = 48
        @sprites["overlay"] = BitmapSprite.new(@sprites["plate"].width - margen, @sprites["plate"].height, @viewport)
        #pbSetSystemFont(@sprites["overlay"].bitmap)
        @sprites["overlay"].bitmap.font.name = "Unown"
        @sprites["overlay"].bitmap.font.size = 40

        plate_sprite = @sprites["plate"]

        plate_sprite.ox = plate_sprite.bitmap.width / 2
        plate_sprite.oy = plate_sprite.bitmap.height / 2
        plate_sprite.angle = 90

        plate_sprite.x = Graphics.width + plate_sprite.oy
        plate_sprite.y = (Graphics.height / 2)

        target_x = Graphics.width / 2
        target_y = (Graphics.height / 2)

        @tweener.add(OpacityTween.new(@sprites["bg"], 160, 0.3)).set_ease(Ease::IN_OUT_SINE)
        @tweener.add(MoveTween.new(plate_sprite, target_x, target_y, 1)).set_ease(Ease::OUT_CUBIC)

        wait_for_tweens

        @tweener.add(ToneTween.new(plate_sprite, Tone.new(-100, -100, -100), 0.3)).set_ease(Ease::IN_OUT_SINE)
        wait_for_tweens

        @tweener.add(RotateTween.new(plate_sprite, 0, 1)).set_ease(Ease::OUT_QUAD)
        wait_for_tweens

        @sprites["overlay"].x = plate_sprite.x - plate_sprite.width / 2 + margen / 2
        @sprites["overlay"].y = plate_sprite.y - 120
        @sprites["overlay"].opacity = 0

        base_color   = Color.new(255, 255, 255, 255)
        shadow_color = Color.new(0, 0, 0, 255)
        text = "<ac>" + pick_plate_descriptions(plate)[0]
        .tr('áéíóúüñÁÉÍÓÚÜÑ', 'aeiouunAEIOUUN')
        .gsub(/[".,']/, '')
        .downcase + "</ac>"
        drawFormattedTextEx(@sprites["overlay"].bitmap, 0, 4, @sprites["overlay"].bitmap.width, text, base_color, shadow_color)

        @tweener.add(OpacityTween.new(@sprites["overlay"], 255, 0.3)).set_ease(Ease::IN_OUT_SINE)
        wait_for_tweens

        loop do
            Graphics.update
            Input.update
            break if Input.trigger?(Input::USE) || Input.trigger?(Input::BACK)
        end

        @tweener.add(OpacityTween.new(@sprites["overlay"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)
        wait_for_tweens

        if @translate
            @sprites["overlay"].y = plate_sprite.y - 68
            @sprites["overlay"].bitmap.clear
            @sprites["overlay"].bitmap.font.name = "Piacevoli"
            @sprites["overlay"].bitmap.font.size = 36
            base_color   = Color.new(255, 255, 255, 255)
            shadow_color = Color.new(0, 0, 0, 255)
            text = "<ac>" + pick_plate_descriptions(plate)[0]
            .tr('áéíóúüñÁÉÍÓÚÜÑ', 'aeiouunAEIOUUN') + "</ac>"
            drawFormattedTextEx(@sprites["overlay"].bitmap, 0, 4, @sprites["overlay"].bitmap.width, text, base_color, shadow_color)


            @tweener.add(OpacityTween.new(@sprites["overlay"], 255, 0.3)).set_ease(Ease::IN_OUT_SINE)
            wait_for_tweens

            loop do
                Graphics.update
                Input.update
                break if Input.trigger?(Input::USE) || Input.trigger?(Input::BACK)
            end

            @tweener.add(OpacityTween.new(@sprites["overlay"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)
            wait_for_tweens
        end

        plate_target_y = -plate_sprite.height
        # @tweener.add(ToneTween.new(plate_sprite, Tone.new(0, 0, 0), 0.3)).set_ease(Ease::IN_OUT_SINE)
        @tweener.add(MoveTween.new(plate_sprite, plate_sprite.x, plate_target_y, 0.5)).set_ease(Ease::IN_SINE)
        @tweener.add(OpacityTween.new(plate_sprite, 0, 1)).set_ease(Ease::IN_SINE)
        @tweener.add(OpacityTween.new(@sprites["bg"], 0, 0.5)).set_ease(Ease::IN_SINE)
        wait_for_tweens

        dispose
    end

  def dispose
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end
