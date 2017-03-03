module Crono
  class Image
    alias TSize = Tuple(Int32, Int32)
    @sdl_img : SDL::Texture
    property src, dimentions

    def initialize(@src : String, @dimentions : TSize)
      @sdl_img = init_sdl_img
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
      IMG.init(IMG::Init.parse(ext))
      IMG.load(@src, Crono.renderer.not_nil!.sdl)
    end
  end
end
