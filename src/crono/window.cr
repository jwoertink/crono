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

    private def init_sdl!
      @sdl_window = SDL::Window.new(title, width, height)
      Crono.renderer = Crono::Renderer.new(sdl)
    end

    private def current_time
      Time.now.epoch_ms
    end

    private def run_game_loop
      update_interval = 120
      draw_interval = 60
      time_of_last_update = current_time
      time_of_last_draw = current_time
      loop do
        case event = SDL::Event.poll
        when SDL::Event::Quit
          break
        when SDL::Event::Keyboard
          key_pressed(event.sym) if event.pressed?
          key_down(event.sym) if event.keydown?
          key_up(event.sym) if event.keyup?
        end

        time_until_update = (update_interval + time_of_last_update) - current_time
        time_until_draw = (draw_interval + time_of_last_draw) - current_time
        work_done = false

        if time_until_update <= 0
          update
          #sdl.update # Do I need this?
          Crono.renderer.sdl.present
          time_of_last_update = current_time
          work_done = true
        end

        if time_until_draw <= 0
          clear_screen
          draw
          time_of_last_draw = current_time
          work_done = true
        end

        if work_done == false
          sleep_seconds = time_until_update

          if time_until_draw < sleep_seconds
            sleep_seconds = time_until_draw
          end
          time_to_sleep = sleep_seconds * 0.001
          sleep(time_to_sleep)
        end
       
        break if @close_window
      end
    end

  end
end
