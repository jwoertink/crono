module Crono
  class Image
    alias TSize = Tuple(Int32, Int32)
    @sdl_img : SDL::Texture
    property src, dimentions

    def initialize(@src : String, @dimentions : TSize)
      @sdl_img = IMG.load(@src, Crono.renderer.not_nil!.@renderer)
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
  end
end
