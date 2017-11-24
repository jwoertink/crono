module Crono
  abstract class Window
    @window_proxy : SF::RenderWindow
    property title : String
    property drawables : Crono::Drawables

    delegate :open?, :close, to: @window_proxy

    def initialize(@width : Int32, @height : Int32)
      @title = "Sample"
      @window_proxy = uninitialized(SF::RenderWindow)
      @drawables = Crono::Drawables.new
    end

    abstract def update
    abstract def draw
    abstract def key_pressed(key_code)

    def show
      init_sfml!
      run_game_loop
    end
 
    private def init_sfml!
      @window_proxy = SF::RenderWindow.new(
        SF::VideoMode.new(@width, @height), @title
      )
      @window_proxy.vertical_sync_enabled = true
    end

    private def run_game_loop
      while open?
        while event = @window_proxy.poll_event
          if event.is_a? SF::Event::KeyPressed
            key_pressed(event.code)
          end
        end

        update
        @window_proxy.clear(SF::Color::Black)
        draw
        @drawables.each { |r| @window_proxy.draw(r[0], r[1]) }
        @window_proxy.display
      end
    end

  end
end
