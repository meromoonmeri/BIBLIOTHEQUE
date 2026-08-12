module Mugshot
  @mugshot = nil
  @mouth = nil
  @name = nil
  @showmouth = true

  FOLDERNAME = {
    "Arceus" => ["Arcy","ArcyRedFlag","ArcyMalito","ArcyYeah","ArcySmile","ArcyHair","ArcyHairYeah","ArcyDown","ArcyShrug","ArcyShrugA","ArcyShrugB","ArcyThink","ArcyThinkA","ArcyThinkB","ArcyLaugh","ArcySurprise","ArcyFire","ArcySwablu","ArcyMuc"],
    
    "Aus" => ["Aus","AusSad","AusYeah","AusYeahHair","AusDown","AusThink","AusThinkA","AusThinkB","AusAngery","AusSurprise", "AusCry", "AusSmile", "AusSmileA", "AusSmileB",
    "AusEinOjerasAlt", "AusEinOjerasAltA", "AusEinOjerasAltB", "AusOjerasAlt", "AusSurpriseOjerasAlt", "AusYeahOjerasAlt",
    "AusAlt", "AusYeahAlt", "AusSurpriseAlt"],

    "Cogita" => ["Cogita","CogitaDown","CogitaThink","CogitaThinkA","CogitaThinkB"],
    "Mesprit" => ["Mesprit","MespritAngery","MespritFunny","MespritSmile","MespritYeah"],
    "Azelf" => ["Azelf"],
    "Uxie" => ["Uxie"],
    "MiniVolo" => ["Volo", "VoloMalito", "VoloAngery", "VoloArms", "VoloArmsA", "VoloArmsB", "VoloSmile", "VoloSurprise", "VoloAlt", "VoloSmileAlt", "VoloSurpriseAlt"],
    "Remi" => ["Remi","RemiFunny","RemiSick","RemiSickSmile","RemiSickSurprise", "RemiSmile", "RemiSurprise"],
  }

  JUSTONCE = ["VoloArmsB", "VoloArms", "CogitaThinkB", "CogitaThink", "ArcyShrug","ArcyShrugB","ArcyThink","ArcyThinkB","AusThink","AusThinkB", "AusEinOjerasAltB", "AusEinOjerasAlt", "AusSmile", "AusSmileB"]

  def self.load(name, darken = false, showmouth = true)
    dispose
    @name = name
    @darken = darken
    @showmouth = showmouth
  end

  def self.find_bitmap(path_without_ext)
    resolved = pbResolveBitmap(path_without_ext + ".png")
    return resolved if resolved
    resolved = pbResolveBitmap(path_without_ext + ".gif")
    return resolved if resolved
    return nil
  end

  def self.show(msgwindow)
    return if @name.nil? || @name.empty?
    
    foldername = nil
    FOLDERNAME.each do |key, value|
      foldername = key if value.include?(@name)
    end
    return if foldername.nil?
    
    # MUGSHOT
    mugshot_path = find_bitmap("Graphics/Pictures/Mugshots/#{foldername}/#{@name}")
    if mugshot_path
      @mugshot = Sprite.new(msgwindow.viewport)
      @mugshot.bitmap = Bitmap.new(mugshot_path)
      if @mugshot.bitmap.animated?
        @mugshot.bitmap.frame_rate = 8
        @mugshot.bitmap.looping = JUSTONCE.include?(@name) ? false : true
        @mugshot.bitmap.play
      end
      @mugshot.zoom_x = 2
      @mugshot.zoom_y = 2
      @mugshot.x = Graphics.width - @mugshot.bitmap.width * 2
      @mugshot.y = Graphics.height - @mugshot.bitmap.height * 2
      @mugshot.z = msgwindow.z - 2
      @mugshot.tone = Tone.new(-155, -155, -155) if @darken
    end

    # MOUTH
    base_mouth     = "Graphics/Pictures/Mugshots/#{foldername}/#{@name}Mouth"
    first_name     = FOLDERNAME[foldername][0]
    base_mouth_alt = "Graphics/Pictures/Mugshots/#{foldername}/#{first_name}Mouth"

    mouth_path = find_bitmap(base_mouth) || find_bitmap(base_mouth_alt)
    if mouth_path
      @mouth = Sprite.new(msgwindow.viewport)
      @mouth.bitmap = Bitmap.new(mouth_path)
      if @mouth.bitmap.animated?
        @mouth.bitmap.frame_rate = 8
        @mouth.bitmap.looping = true
        @mouth.bitmap.play
      end
      @mouth.zoom_x = 2
      @mouth.zoom_y = 2
      @mouth.x = Graphics.width - @mouth.bitmap.width * 2
      @mouth.y = @mugshot ? @mugshot.y : Graphics.height - @mouth.bitmap.height * 2
      @mouth.z = @mugshot ? @mugshot.z : msgwindow.z - 2
      @mouth.tone = @mugshot ? @mugshot.tone : nil
      @mouth.opacity = @darken ? 0 : 255
      @mouth.visible = @showmouth
    end
  end

  def self.showMouth
    return unless @mouth
    @mouth.visible = true if @showmouth
  end

  def self.running?
    return !@mugshot.nil?
  end

  def self.hideMouth
    return unless @mouth
    @mouth.visible = false
  end

  def self.dispose
    @mugshot&.dispose
    @mugshot = nil
    @mouth&.dispose
    @mouth = nil
    @hold_frame_timer = nil
    @name = nil
  end
end