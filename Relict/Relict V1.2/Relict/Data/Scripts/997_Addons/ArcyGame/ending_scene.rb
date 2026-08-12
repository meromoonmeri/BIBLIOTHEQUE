class ArcyBye
    def initialize
        @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
        @viewport.z = 99999
        @sprites = {}
        @tweener = Tweener.new
        
        load_files
        dialogue
        dispose
    end

    def load_files
        @sprites["bg"] = Sprite.new(@viewport)
        @sprites["arcy"] = Sprite.new(@viewport)
        @sprites["black"] = Sprite.new(@viewport)
        @sprites["msgwindow"] = pbCreateMessageWindow(@viewport)
        @sprites["msgwindow"].windowskin = nil

        @sprites["bg"].bitmap = Bitmap.new(sprintf("Graphics/UI/arcybye/arcybg"))
        @sprites["bg"].bitmap.play if @sprites["bg"].bitmap.animated?
        @sprites["bg"].zoom_x = 2; @sprites["bg"].zoom_y = 2
        @sprites["arcy"].bitmap = Bitmap.new(sprintf("Graphics/UI/arcybye/arcymain"))
        @sprites["arcy"].bitmap.play if @sprites["arcy"].bitmap.animated?
        @sprites["arcy"].bitmap.looping = false
        @sprites["arcy"].zoom_x = 2; @sprites["arcy"].zoom_y = 2
        @sprites["arcy"].tone = Tone.new(-20, -60, -35)
        @sprites["black"].bitmap = Bitmap.new(sprintf("Graphics/Pictures/black"))
    end

    def dialogue
        @tweener.add(OpacityTween.new(@sprites["black"], 0, 3)).set_ease(Ease::OUT_CUBIC)
        @tweener.wait_completion
        # ==========================================
        while @sprites["arcy"].bitmap.playing
            Graphics.update
        end
        @sprites["arcy"].bitmap = Bitmap.new(sprintf("Graphics/UI/arcybye/arcyloop"))
        @sprites["arcy"].bitmap.play if @sprites["arcy"].bitmap.animated?
        # ==========================================
        pbMessageDisplay(@sprites["msgwindow"], _INTL("\\tg[Arceus]Though I've been defeated, I've had a lot of fun."))
        pbMessageDisplay(@sprites["msgwindow"], _INTL("\\tg[Arceus]That's why it's only fair that I bid my opponent a proper goodbye."))
        pbMessageDisplay(@sprites["msgwindow"], _INTL("\\tg[Arceus]I am glad that I chose you to call to this world..."))
        @sprites["msgwindow"].text = "" # evil necesario o como se diga ig
        pbWait(0.6)
        # ==========================================
        @tweener.add(OpacityTween.new(@sprites["black"], 255, 3)).set_ease(Ease::IN_CUBIC)
        @tweener.wait_completion
        pbWait(0.6)
        # ==========================================
        pbMessageDisplay(@sprites["msgwindow"], _INTL("\\tg[Arceus]Fare thee well."))
        @sprites["msgwindow"].text = ""
    end

    def dispose
        pbDisposeMessageWindow(@sprites["msgwindow"])
        pbDisposeSpriteHash(@sprites)
        @viewport.dispose
    end
end