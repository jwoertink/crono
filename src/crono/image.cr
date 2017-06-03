module Crono
  class Image
    alias TSize = Tuple(Int32, Int32)
    @sdl_img : SDL::Texture
    property src, dimentions

    def self.load_tiles(src : String, dimentions : TSize)
      img = self.new(src, dimentions)
      sprite = SDL::Texture.from(img, Crono.renderer.not_nil!.sdl)
      # img.width, img.height
      # have the sprite size by dimentions[0] and dimentions[1]
      # need to calculate how many sprites can be pulled from this size
      # if the img is 200x25 and the dimentions are {25, 25}
      # then the total amount of sprites would be 8
      # (width / d[0]) * (height / d[1])
      # (200   / 25)   * (25     / 25)
      # What happens if the image is a wonky size like 326x48
      # (326 / 25)13.04 * (48 / 25)1.92 = 25.036....
      # If we floor the values it would be 13. That's a big difference
      # We need this to return some sort of collection. It should have the img and
      # all of the sprite locations which would be a SDL::Rect
      # Maybe use it like this?
      # render.copy(sprite[0].image, sprite[0].clip, location_to_draw)
    end

    def initialize(@src : String, @dimentions : TSize)
      @sdl_img = init_sdl_img
    end

    def initialize(@src : String)
      @sdl_img = init_sdl_img
      @dimentions = {1,1}
    end

    def width
      @dimentions[0]?
    end

    def height
      @dimentions[1]?
    end

    # TODO: find a better name for this proxy method
    def sdl
      @sdl_img
    end

    private def init_sdl_img
      ext = File.extname(@src)[1..-1]
      #NOTE: If loading a .bmp, should it be init somehow?
      if ["jpg", "png", "tif"].includes?(ext)
        SDL::IMG.init(SDL::IMG::Init.parse(ext))
        SDL::IMG.load(@src, Crono.renderer.not_nil!.sdl)
      else
        bmp = SDL.load_bmp(@src)
        bmp.color_key = {255, 0, 255}
        SDL::Texture.from(bmp, Crono.renderer.sdl)
      end
    end
  end
end
