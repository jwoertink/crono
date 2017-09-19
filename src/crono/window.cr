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
      after_init
      run_game_loop
    end

    def after_init
    end

    def clear_screen
      Crono.renderer.clear
    end

    def close
      @close_window = true
    end
 
    abstract def update
    abstract def draw
    
    def key_pressed(key)
    end

    def key_down(key)
    end

    def key_up(key)
    end

    def sdl
      @sdl_window.not_nil!
    end

    def handle_event(event)
      key_pressed(event.sym) if event.pressed? && event.repeat == 0
      key_down(event.sym) if event.keydown?
      key_up(event.sym) if event.keyup?
    end

    private def init_sdl!
      @sdl_window = SDL::Window.new(title, width, height)
      Crono.renderer = Crono::Renderer.new(sdl)
    end

    private def current_time
      Time.now.epoch_ms
    end

    private def run_game_loop
      loop do
        case event = SDL::Event.poll
        when SDL::Event::Quit
          break
        when SDL::Event::Keyboard
          handle_event(event)
        end

        update
        clear_screen
        draw
        Crono.renderer.present
        break if @close_window
      end
    end

  end
end
