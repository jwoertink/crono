require "sdl"
require "sdl/image"
require "sdl/ttf"
require "./crono/*"


SDL.init(SDL::Init::VIDEO)
at_exit { SDL.quit  }
