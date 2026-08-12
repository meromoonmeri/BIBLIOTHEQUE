class PokemonSystem
  alias_method :difficulty_initialize, :initialize unless method_defined?(:difficulty_initialize)
  attr_accessor :difficulty

  def initialize
    difficulty_initialize
    @difficulty = 0
  end
end

MenuHandlers.add(:options_menu, :difficulty, {
  "name"        => _INTL("Difficulty"),
  "order"       => 0,
  "type"        => EnumOption,
  "parameters"  => [_INTL("Normal"), _INTL("Hard"), _INTL("Unfair")],
  "description" => _INTL("Select the degree of difficulty of thy adventure. Thou mayst amend thy choice at any time."),
  "get_proc"    => proc { next $PokemonSystem.difficulty },
  "set_proc"    => proc { |value, _scene| $PokemonSystem.difficulty = value }
})

class PickDifficulty
  def initialize
    @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99_999
    @sprites = {}
    @tweener = Tweener.new
    @cursor_move_tween = nil
    @index = 0

    setup
    run
  end

  def setup
    setup_background
    setup_difficulties
    setup_cursor
    position_offscreen

    animate_intro
  end

  def run
    loop do
      Graphics.update
      Input.update
      update
      break if @exit_loop
    end
    dispose
  end

  def update
    if @tweener.isDone?
      handle_input
    end

    @tweener.update
    Graphics.update

    @cursor_move_tween = nil if @tweener.isDone?
  end

  def dispose
    play_exit_animation
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

  def setup_background
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = pbBitmap("Graphics/UI/DifficultyPick/bg")
    @sprites["bg"].opacity = 0
  end

  def setup_difficulties
    button_w = 484
    xpos = ((Graphics.width - button_w) / 2.0).to_i
    ypos = 70
    gap = 120

    @difficulties = [
      [_INTL("NORMAL"), _INTL("Normal difficulty")],
      [_INTL("HARD"), _INTL("Hard difficulty")],
      [_INTL("UNFAIR"), _INTL("Unfair difficulty")]
    ]

    @original_positions = []

    @difficulties.each_with_index do |(title, desc), i|
      btn_key = "button#{i}"
      overlay_key = "overlay#{i}"

      @sprites[btn_key] = Sprite.new(@viewport)
      @sprites[btn_key].bitmap = pbBitmap("Graphics/UI/DifficultyPick/#{btn_key}")
      @sprites[btn_key].x = xpos
      @sprites[btn_key].y = ypos + i * gap

      @original_positions[i] = [@sprites[btn_key].x, @sprites[btn_key].y]

      button_bitmap = @sprites[btn_key].bitmap
      width = button_bitmap.width
      height = button_bitmap.height

      @sprites[overlay_key] = BitmapSprite.new(width, height, @viewport)
      @sprites[overlay_key].x = @sprites[btn_key].x
      @sprites[overlay_key].y = @sprites[btn_key].y
      pbSetSystemFont(@sprites[overlay_key].bitmap)

      base_color = Color.new(0, 0, 0, 255)
      shadow_color = Color.new(0, 0, 0, 50)

      text = "<ac>#{title}\n#{desc}</ac>"
      drawFormattedTextEx(
        @sprites[overlay_key].bitmap,
        20,
        24,
        @sprites[overlay_key].bitmap.width,
        text,
        base_color,
        shadow_color
      )
    end
  end

  def setup_cursor
    @sprites["cursor"] = Sprite.new(@viewport)
    @sprites["cursor"].bitmap = pbBitmap("Graphics/UI/DifficultyPick/check")
    @sprites["cursor"].x = @sprites["overlay0"].x
    @sprites["cursor"].y = @sprites["overlay0"].y
    @sprites["cursor"].opacity = 0
  end

  def position_offscreen
    space = 200
    @difficulties.length.times do |i|
      offset = Graphics.width + space * i
      @sprites["overlay#{i}"].x = @original_positions[i][0] + offset
      @sprites["overlay#{i}"].y = @original_positions[i][1]
      @sprites["button#{i}"].x = @sprites["overlay#{i}"].x
      @sprites["button#{i}"].y = @sprites["overlay#{i}"].y
    end
  end

  def animate_intro
    @tweener.add(OpacityTween.new(@sprites["bg"], 255, 1)).set_ease(Ease::IN_OUT_SINE)

    @difficulties.length.times do |i|
      target_x, target_y = @original_positions[i]
      @tweener.add(MoveTween.new(@sprites["button#{i}"], target_x, target_y, 1)).set_ease(Ease::OUT_CUBIC)
      @tweener.add(MoveTween.new(@sprites["overlay#{i}"], target_x, target_y, 1)).set_ease(Ease::OUT_CUBIC)
    end

    while !@tweener.isDone?
      @tweener.update
      Graphics.update
    end

    @tweener.add(OpacityTween.new(@sprites["cursor"], 255, 0.1)).set_ease(Ease::IN_OUT_SINE)

    while !@tweener.isDone?
      @tweener.update
      Graphics.update
    end
  end

  def handle_input
    if Input.trigger?(Input::UP)
        @index -= 1
        @index = @difficulties.length - 1 if @index < 0
        pbPlayCursorSE
        start_cursor_tween
    elsif Input.trigger?(Input::DOWN)
        @index += 1
        @index = 0 if @index >= @difficulties.length
        pbPlayCursorSE
        start_cursor_tween
    elsif Input.trigger?(Input::USE)
        start_cursor_tween if @cursor_move_tween
        confirm_selection
    end
  end

  def confirm_selection
    message = _INTL("\\tg[???]Dost thou truly wish to select the {1} difficulty?", @difficulties[@index][0])
    choice = pbConfirmMessage(message)

    if choice
        $PokemonSystem.difficulty = @index
        pbPlayDecisionSE
        pbMessage(_INTL("\\tg[???]Hahahahaha... Very well.")) if @index == 2
        @exit_loop = true
    else
        pbPlayCancelSE
    end
  end

  def start_cursor_tween
    return if @cursor_move_tween

    target_x = @sprites["overlay#{@index}"].x
    target_y = @sprites["overlay#{@index}"].y

    @cursor_move_tween = MoveTween.new(@sprites["cursor"], target_x, target_y, 0.2)
    @cursor_move_tween.set_ease(Ease::OUT_CUBIC)
    @tweener.add(@cursor_move_tween)
  end

  def play_exit_animation
    space = 200

    @difficulties.length.times do |i|
      offscreen_x = @original_positions[i][0] + Graphics.width + space * i
      offscreen_y = @original_positions[i][1]

      @tweener.add(MoveTween.new(@sprites["button#{i}"], offscreen_x, offscreen_y, 1)).set_ease(Ease::IN_OUT_SINE)
      @tweener.add(MoveTween.new(@sprites["overlay#{i}"], offscreen_x, offscreen_y, 1)).set_ease(Ease::IN_OUT_SINE)
    end

    @tweener.add(OpacityTween.new(@sprites["bg"], 0, 1)).set_ease(Ease::IN_OUT_SINE)
    @tweener.add(OpacityTween.new(@sprites["cursor"], 0, 0.3)).set_ease(Ease::IN_OUT_SINE)

    while !@tweener.isDone?
      @tweener.update
      Graphics.update
    end
  end
end
