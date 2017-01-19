module Crono
  class Renderer
    @sdl_renderer : SDL::Renderer

    def initialize(window : SDL::Window)
      @sdl_renderer = SDL::Renderer.new(window)
    end

    def sdl
      @sdl_renderer
    end

    def draw(color : Color::TColor)
      sdl.draw_color = color
      # Not sure what these are for, but it works with them...
      sdl.clear
      sdl.present
    end

    def draw(image : Image, location : Tuple(Int32, Int32, Int32))
      sdl.viewport = {location[0], location[1], image.width, image.height}
      sdl.copy(image.sdl)
      sdl.present
    end
  end
end
