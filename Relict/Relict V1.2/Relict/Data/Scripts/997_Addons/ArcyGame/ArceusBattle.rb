def arceusBattleEventing
  $scene.spriteset($game_map.map_id).changeBackgroundArceus

  $PokemonGlobal.nextBattleBack = "Arceus"
  arceusBattle
  pbMoveRoute($game_player,[
      PBMoveRoute::ALWAYS_ON_TOP_OFF
  ])
  pbMoveRoute($game_map.events[4],[
      PBMoveRoute::ALWAYS_ON_TOP_OFF
  ])

  $scene.spriteset($game_map.map_id).disposeBlackScreen

  if $game_variables[1] != 2
      pbSetSelfSwitch(5, "A", true)
  else
      return
  end
end

class Spriteset_Map

  def disposeBlackScreen
    @black_overlay.dispose if @black_overlay
  end

  def changeBackgroundArceus
    first_name = "Origin0"
    @black_overlay = Sprite.new(@@viewport1)
    @black_overlay.bitmap = Bitmap.new("Graphics/Panoramas/Origin0")
    @black_overlay.opacity = 0
    @black_overlay.z = 800

    tmox = (@map.display_x / Game_Map::X_SUBPIXELS).round
    tmoy = (@map.display_y / Game_Map::Y_SUBPIXELS).round
    @black_overlay.ox = tmox
    @black_overlay.oy = tmoy
    
    pbMoveRoute($game_player,[
       PBMoveRoute::ALWAYS_ON_TOP_ON
    ])
    pbMoveRoute($game_map.events[4],[
       PBMoveRoute::ALWAYS_ON_TOP_ON
    ])
    pbWait(0.2)

    fade_in_black(30)

    names = ["Origin1", "Origin2", "Origin3", "Origin4", "Origin5", "Origin6", "Origin7", "Origin8"]

    names.each_with_index do |name, i|
    if i == names.size - 1
        $game_screen.start_tone_change(Tone.new(255, 255, 255, 0), 8)
        pbWait(1)
        
        change_black_screen_image(name)

        pbSEPlay("NEWArceusEffect2")
        $game_screen.start_tone_change(Tone.new(0, 0, 0, 0), 8)
        pbWait(1)
    else
        pbSEPlay("NEWArceusEffect1")  
        change_black_screen_image(name)
        pbWait(0.6)
    end
    end

    pbCameraShake(3)
    Pokemon.play_cry(:ARCEUS)
    pbWait(1)

    pbCameraShakeOff
    pbWait(1)
  end

  def change_black_screen_image(filename)
    @black_overlay.bitmap.dispose if @black_overlay.bitmap && !@black_overlay.bitmap.disposed?
    @black_overlay.bitmap = Bitmap.new("Graphics/Panoramas/#{filename}")
    @black_overlay.opacity = 255
    @black_overlay.z = 800
  end

def fade_in_black(duration = 30)
    duration.times do |i|
        opacity = (255 * (i + 1) / duration.to_f).to_i
        @black_overlay.opacity = opacity
        Graphics.update
    end
end

end