def gameoverPic
    if $PokemonGlobal.dungeonFloor != 100
        viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
        viewport.z = 99999
        sprites = {}
        sprites["bg"] = Sprite.new(viewport)
        pick = TILESETS_TEMPLATES_BATTLEBACK.values.find { |entry| entry[1] == $game_map.tileset_name }
        bgname = pick[2]
        sprites["bg"].bitmap = pbBitmap("Graphics/Battlebacks/" + bgname + "_bg") 
        sprites["characters"] = Sprite.new(viewport)
        sprites["characters"].bitmap = pbBitmap("Graphics/Pictures/gameover")
        sprites["characters"].bitmap.play if sprites["characters"].bitmap.animated?

        pbFadeInAndShow(sprites)
        pbWait(0.6)

        pbMessage(_INTL("\\tg[Arceus]We are to accept everything as it is..."))
        pbWait(0.6)

        pbFadeOutAndHide(sprites)
        pbDisposeSpriteHash(sprites)
        viewport.dispose
    end
    $PokemonGlobal.dungeonFloor = 0
end
