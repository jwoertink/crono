module Crono
  class Renderer
    @renderer : SDL::Renderer

    def initialize(window : SDL::Window)
      @renderer = SDL::Renderer.new(window)
    end

    def draw(color : Tuple(Int32, Int32, Int32, Int32))
      @renderer.draw_color = color
      # Not sure what these are for, but it works with them...
      @renderer.clear
      @renderer.present
    end
  end
end
