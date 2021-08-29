require "sdl"
require "sdl/image"
require "sdl/ttf"
require "sdl/mix"
require "lua"
require "./crono/*"

SDL.init(SDL::Init::VIDEO | SDL::Init::AUDIO)
SDL::TTF.init
SDL::Mix.init(SDL::Mix::Init::FLAC)
SDL::Mix.open
LUA = Lua.load

# When you close, we all close
at_exit {
  SDL::IMG.quit
  SDL::TTF.quit
  SDL::Mix.quit
  SDL.quit
  LUA.close
}

module Crono
  extend GameMath

  def self.boot(code : GameLoader, config : GameConfig)
    window = SDL::Window.new(config.title, config.width, config.height)
    renderer = SDL::Renderer.new(window)
    LUA.set_global "crono", Crono::Util.new(renderer)

    LUA.run File.new(Path[code.path.normalize, "main.lua"])

    loop do
      case event = SDL::Event.wait
      when SDL::Event::Quit
        break
      end
      renderer.draw_color = Color::BLACK
      renderer.clear

      LUA.run "draw()"
      LUA.run "update()"
      renderer.present
    end
  end
end
