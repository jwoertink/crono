module Crono
  class Renderer
    @sdl_renderer : SDL::Renderer
    delegate clear, to: @sdl_renderer

    def initialize(window : SDL::Window)
      @sdl_renderer = SDL::Renderer.new(window)
    end

    def sdl
      @sdl_renderer
    end

    def color=(color)
      sdl.draw_color = color
      sdl.clear
      color
    end

    def color
      sdl.draw_color
    end

    def draw(image : Image, location : Tuple(Int32, Int32))
      sdl.viewport = {location[0], location[1], image.width, image.height}
      sdl.copy(image.sdl)
    end

    def draw(font : Font, location : Tuple(Int32, Int32))
      surface = font.draw
      sdl.copy(surface, dstrect: {location[0], location[1], surface.width, surface.height})
    end
  end
end
