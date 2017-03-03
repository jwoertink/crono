module Crono
  abstract class Window
    include ArtSupplies
    property width : Int32
    property height : Int32 
    property title : String

    @sdl_window : SDL::Window?
    
    def initialize(width, height)
      @width = width
      @height = height
      @title = "Sample"
      @close_window = false
    end

    def show
      init_sdl!
      loop do
        case event = SDL::Event.wait
        when SDL::Event::Quit
          break
        when SDL::Event::Keyboard
          key_pressed(event.sym) if event.pressed?
          key_down(event.sym) if event.keydown?
          key_up(event.sym) if event.keyup?
        end

        update
        sdl.update
        break if @close_window
      end
    end

    def close
      @close_window = true
    end
 
    abstract def update
    
    def key_pressed(key)
    end

    def key_down(key)
    end

    def key_up(key)
    end

    def sdl
      @sdl_window.not_nil!
    end

    private def init_sdl!
      @sdl_window = SDL::Window.new(title, width, height)
      Crono.renderer = Crono::Renderer.new(@sdl_window.not_nil!)
    end

  end
end
