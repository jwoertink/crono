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
      @sdl_renderer.draw_color = color
      # Not sure what these are for, but it works with them...
      @sdl_renderer.clear
      @sdl_renderer.present
    end

    def draw(image : Image, location : Tuple(Int32, Int32, Int32))
      @sdl_renderer.viewport = {location[0], location[1], image.width, image.height}
      @sdl_renderer.copy(image.data)
      @sdl_renderer.present
    end
  end
end
