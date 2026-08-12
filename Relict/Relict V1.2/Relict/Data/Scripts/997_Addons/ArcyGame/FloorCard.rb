class NextFloor
  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    setup
  end

  def setup
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = pbBitmap("Graphics/UI/floorBG")
    @sprites["overlay"] = BitmapSprite.new(Graphics.width, Graphics.height, @viewport)
    @sprites["overlay"].bitmap.font.name = "Cafeteria Black"
    @sprites["overlay"].bitmap.font.size = 60
    base_color   = Color.new(255, 255, 255, 255)
    shadow_color = Color.new(0, 0, 0, 255)
    text = "<ac>" + _INTL("Destiny Tower\n\nFloor {1}", $PokemonGlobal.dungeonFloor + 1) + "</ac>"
    drawFormattedTextEx(@sprites["overlay"].bitmap, 0, Graphics.height / 2 - 80, @sprites["overlay"].bitmap.width, text, base_color, shadow_color)

    pbFadeInAndShow(@sprites)
    pbWait(1)

    dispose
  end

  def dispose
    pbFadeOutAndHide(@sprites)
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
end