class ArceusIntroScene
  def initialize(viewport = nil)
    @delta = 3.0
    @particles = 24
    @viewport = viewport || Viewport.new(0, 0, Graphics.width, Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    @rings = []
    @ring_timer = 8
    @ring_interval = 200
    @max_rings = 2
    @next_zoom = 0.2
    setup
    mainDialogue
  end

  def setup
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = pbBitmap("Graphics/EBDX/Transitions/Arceus/background")
    @particles.times do |i|
      @sprites["p#{i}"] = AnimatedSpriteParticle.new(@viewport, rand(@particles))
      @sprites["p#{i}"].dy = @viewport.rect.height / 2
      @sprites["p#{i}"].inverted = false
      @sprites["p#{i}"].refresh
      @sprites["p#{i}"].blend_type = 1
    end
    @sprites["shine"] = Sprite.new(@viewport)
    @sprites["shine"].bitmap = pbBitmap("Graphics/EBDX/Transitions/Arceus/shine")
    @sprites["shine"].center!
    @sprites["shine"].x = Graphics.width / 2
    @sprites["shine"].y = Graphics.height / 2
    @sprites["shine"].opacity = 0
    @sprites["shine"].toggle = 1
    @sprites["shine"].blend_type = 1
    pbFadeInAndShow(@sprites)
  end

  def mainDialogue
    pbWait(5) {update}
    pbMessage(_INTL("\\tg[???]I welcome thee to one of mine realms, where the very fabric of time and space is unbound...")) {update}
    pbMessage(_INTL("\\tg[???]I am that which humans call <c3=e4c255ff>Arceus</c3>.")) {update}
    pbWait(3) {update}
    loop do
      pbMessage(_INTL("\\tg[???]Now, I wish to know thy name.")) {update}
      pbTrainerName(nil, 0, _INTL("What is thy name?"), _INTL("Mallie")) {update}
      if pbConfirmMessage(_INTL("\\tg[???]<c3=e4c255ff>\\PN</c3>... Is that correct?")) {update}
        break
      end
    end

    pbWait(3) {update}
    pbMessage(_INTL("\\tg[???]Select the degree of difficulty of thy adventure. Thou mayst amend thy choice at any time.")) {update}

    PickDifficulty.new {update}

    pbWait(3) {update}
    pbMessage(_INTL("\\tg[???]Soon thou shalt find thyself in a place strange to thee...")) {update}
    pbMessage(_INTL("\\tg[???]A place where a most unfortunate event hath transpired.")) {update}
    pbWait(3) {update}
    pbMessage(_INTL("\\tg[???]Seek me out... that we may set right what hath gone awry.")) {update}
    dispose
  end

  def update
    if @ring_timer <= 0 && @rings.length < @max_rings
      @rings << ArceusRing.new(@viewport, @next_zoom)
      @next_zoom += 0.02
      @ring_timer = @ring_interval
    else
      @ring_timer -= 1
    end

    @rings.each { |ring| ring.update(@delta) }
    @particles.times { |i| @sprites["p#{i}"].update }

    s = @sprites["shine"]
    s.opacity += 8 / @delta if s.opacity < 255
    s.angle += 2 / @delta if $PokemonSystem.screensize < 2
    s.zoom_x -= 0.01 * s.toggle / @delta
    s.zoom_y -= 0.01 * s.toggle / @delta
    s.toggle *= -0.1 if s.zoom_x <= 0.8 || s.zoom_x >= 1.2
  end

  def finish
    @viewport.color = Color.new(0, 0, 0, 0)
    16.delta_add.times do
      @viewport.color.alpha += 32/@delta
      Graphics.update
    end
    @viewport.color = Color.black
  end

  def dispose
    finish
    pbDisposeSpriteHash(@sprites)
    @rings.each(&:dispose)
    @viewport.dispose
  end
end

class ArceusRing
  attr_reader :sprite

  def initialize(viewport, zoom, file = "Graphics/EBDX/Transitions/Arceus/glow")
    @initial_zoom = zoom
    @sprite = Sprite.new(viewport)
    @sprite.bitmap = pbBitmap(file)
    @sprite.ox = @sprite.bitmap.width / 2
    @sprite.oy = @sprite.bitmap.height / 2
    @sprite.x = viewport.width / 2
    @sprite.y = viewport.height / 2
    reset
  end

  def reset
    @sprite.zoom_x = @initial_zoom
    @sprite.zoom_y = @initial_zoom
    @sprite.opacity = 0
    @fading_in = true
  end

  def update(delta)
    @sprite.zoom_x += 0.01 / delta
    @sprite.zoom_y += 0.01 / delta
    if @fading_in
      @sprite.opacity += 4 / delta
      @fading_in = false if @sprite.opacity >= 255
    else
      @sprite.opacity -= 4 / delta
      reset if @sprite.opacity <= 0
    end
  end

  def dispose
    @sprite.dispose
  end
end

class AnimatedSpriteParticle < Sprite
  attr_accessor :inverted
  attr_accessor :repeat
  attr_accessor :count
  attr_accessor :dy
  attr_accessor :dx
  def initialize(viewport,delay=0)
    @dx = viewport.rect.width/2
    @dy = viewport.rect.height/4
    @repeat = -1
    @count = 0
    super(viewport)
    @inverted = true
    self.refresh
    @delay = delay
    @frame = 0
    self.visible = false
  end
  
  def update
    return if @repeat > 0 && @count > @repeat
    @frame+=1
    return if @frame < @delay
    self.visible = true
    @px-= @inverted ? (@px-@pos[0])*(0.002*@speed) : (@pos[0]-@px)*(0.002*@speed)
    @py-= @inverted ? (@py-@pos[1])*(0.002*@speed) : (@pos[1]-@py)*(0.002*@speed)
    self.x = @px
    self.y = @py
    s = @inverted ? 0.5 : 1
    self.opacity-=0.5*@speed*s
    self.refresh if self.opacity <= 0
  end
  
  def refresh
    self.opacity = 255
    self.x = @dx
    self.y = @dy
    x = rand(@dx*2 + 32*4)-32*2
    y = rand(@dy*2 + 32*4)-32*2
    x1 = rand(2)<1 ? -rand(32) : @dx*2+rand(32)
    y1 = @dy-46+rand(92)
    @pos = [
      @inverted ? @dx : x,
      @inverted ? @dy : y
    ]
    @px = @inverted ? x1 : @dx
    @py = @inverted ? y1 : @dy
    @speed = (rand(16)+1)*0.1
    @speed*=4 if @inverted
    if rand(2) < 1
      self.bitmap = pbBitmap("Graphics/EBDX/Transitions/Arceus/particle0")
    else
      self.bitmap = pbBitmap("Graphics/EBDX/Transitions/Arceus/particle1")
    end
    self.ox = self.bitmap.width/2
    self.oy = self.bitmap.height/2
    @count+=1 if @repeat > 0
  end
end