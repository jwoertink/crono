module Crono
  class Image
    alias TSize = Tuple(Int32, Int32)
    @sdl_img : SDL::Texture
    property src, dimentions

    # May need to implement SDL_CreateTextureFromSurface for this to work
    def self.load_tiles(src : String, dimentions : TSize)
      #img = new(src)
      #Crono.renderer.sdl.copy(img.sdl, srcrect: {0, 0, 200, 50}, dstrect: {0, 0, 50, 50})
      #SDL::Surface.load_texture(Crono.renderer.sdl, img.sdl)
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
      SDL::IMG.init(SDL::IMG::Init.parse(ext))
      SDL::IMG.load(@src, Crono.renderer.not_nil!.sdl)
    end
  end
end
