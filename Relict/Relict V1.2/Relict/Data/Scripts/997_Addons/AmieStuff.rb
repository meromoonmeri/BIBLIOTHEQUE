class Sprite
  # function used to to mask the Sprite's current bitmap with another
  def mask(mask = nil,xpush = 0,ypush = 0)
    # exits out of the function if the sprite currently has no bitmap to mask
    return false if !self.bitmap
    # backs up the Sprites current bitmap
    bitmap = self.bitmap.clone
    # check for mask types
    if mask.is_a?(Bitmap) # accepts Bitmap.new
      mbmp = mask
    elsif mask.is_a?(Sprite) # accepts other Sprite.new
      mbmp = mask.bitmap
    elsif mask.is_a?(String) # accepts Strings
      mbmp = BitmapCache.load_bitmap(mask)
    else # exits if non-matching type
      return false
    end
    # creates a new bitmap
    self.bitmap = Bitmap.new(mbmp.width, mbmp.height)
    # creates the main mask
    mask = mbmp.clone
    # calculates the dimension metrics for pixel transfer
    ox = (bitmap.width - mbmp.width) / 2
    oy = (bitmap.height - mbmp.height) / 2
    width = mbmp.width + ox
    height = mbmp.height + oy
    # draws pixels to mask bitmap
    for y in oy...height
      for x in ox...width
        # gets pixel of mask for analysis
        pixel = mask.get_pixel(x - ox, y - oy)
        # gets pixel of current bitmap for analysis
        color = bitmap.get_pixel(x - xpush, y - ypush)
        # sets the new alpha to use the value of the mask alpha
        alpha = pixel.alpha
        alpha = color.alpha if color.alpha < pixel.alpha
        # draws new pixels onto the Sprite's bitmap
        self.bitmap.set_pixel(x - ox, y - oy, Color.new(color.red, color.green,color.blue, alpha))
      end
    end
    # returns finalized bitmap to be used elsewhere
    return self.bitmap
  end
end


def objectParams?(object=nil)
  return 0, 0, 0, 0 if object.nil?
  x, y, w, h = 0, 0, 0, 0
  if object.is_a?(Sprite)
    x = (object.x-object.ox)
    y = (object.y-object.oy)
    if object.respond_to?(:viewport) && object.viewport
      x+=object.viewport.rect.x
      y+=object.viewport.rect.y
    end
    w = (object.bitmap.width*object.zoom_x) if object.bitmap
    h = (object.bitmap.height*object.zoom_y) if object.bitmap
    if object.respond_to?(:src_rect)
      w = (object.src_rect.width*object.zoom_x) if object.bitmap && object.src_rect.width != object.bitmap.width
      h = (object.src_rect.height*object.zoom_y) if object.bitmap && object.src_rect.height != object.bitmap.height
    end
    #w = (object.width*object.zoom_x) if object.respond_to?(:width)
    #h = (object.height*object.zoom_y) if object.respond_to?(:height)
  elsif object.is_a?(Viewport)
    x, y, w, h = object.rect.x, object.rect.y, object.rect.width, object.rect.height
  else
    x = (object.x) if object.respond_to?(:x)
    y = (object.y) if object.respond_to?(:y)
    if object.respond_to?(:viewport) && object.viewport
      x+=object.viewport.rect.x
      y+=object.viewport.rect.y
    end
    w = (object.width) if object.respond_to?(:width)
    h = (object.height) if object.respond_to?(:height)
  end
  return x, y, w, h
end

def overPixel?(*args)
  sprite, void = args
  return false if !sprite.respond_to?(:bitmap)
  bitmap = sprite.bitmap
  x, y, w, h = objectParams?(sprite)
  bx = Input.mouse_x-x
  by = Input.mouse_y-y
  return true if bitmap.get_pixel(bx,by).alpha>0
  return false
end

class Sprite
  attr_accessor :outlineAmie

  def outlineAmie
    @outlineAmie=false if !@outlineAmie
    return @outlineAmie
  end

  def create_outline(color,thickness=2,hard=false)
    return false if !self.bitmap
    bmp = self.bitmap.clone
    self.bitmap = Bitmap.new(bmp.width,bmp.height)
    for x in 0...bmp.width-thickness
      for y in 0...bmp.height
        pixel = bmp.get_pixel(x,y)
        if pixel.alpha > 0
          for i in 1..thickness
            c1 = bmp.get_pixel(x,y-i)
            c2 = bmp.get_pixel(x,y+i)
            c3 = bmp.get_pixel(x-i,y)
            c4 = bmp.get_pixel(x+i,y)
            self.bitmap.set_pixel(x,y-i,color) if c1.alpha <= 0
            self.bitmap.set_pixel(x,y+i,color) if c2.alpha <= 0
            self.bitmap.set_pixel(x-i,y,color) if c3.alpha <= 0
            self.bitmap.set_pixel(x+i,y,color) if c4.alpha <= 0
          end
        end
      end
    end
    self.bitmap.blt(0,0,bmp,Rect.new(0,0,bmp.width,bmp.height))
  end
end
