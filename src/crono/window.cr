module Crono
  abstract class Window
    include ArtSupplies
    property width : Int32
    property height : Int32 
    property title : String
    
    def initialize(width, height)
      @width = width
      @height = height
      @title = "Sample"
    end

    def show
      sdl_window = init_sdl!
      loop do
        case event = SDL::Event.wait
        when SDL::Event::Quit
          break
        end

        update
        sdl_window.update
      end
    end
 
    abstract def update

    private def init_sdl!
      sdl_window = SDL::Window.new(title, width, height)
      Crono.renderer = Crono::Renderer.new(sdl_window)
      sdl_window 
    end

  end
end
