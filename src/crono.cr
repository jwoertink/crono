require "sdl"
require "sdl/image"
require "sdl/ttf"
require "sdl/mix"
require "./crono/*"

SDL.init(SDL::Init::VIDEO | SDL::Init::AUDIO)
SDL::TTF.init
SDL::Mix.init(SDL::Mix::Init::FLAC)
SDL::Mix.open

# When you close, we all close
at_exit {
  SDL::IMG.quit
  SDL::TTF.quit
  SDL::Mix.quit
  SDL.quit
}

module Crono
  extend GameMath
end
