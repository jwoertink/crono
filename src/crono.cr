require "sdl"
require "sdl/image"
require "sdl/ttf"
require "./crono/*"


SDL.init(SDL::Init::VIDEO)
at_exit { SDL.quit }

module Crono
  @@renderer : Crono::Renderer?

  def self.renderer
    @@renderer
  end

  def self.renderer=(new_renderer)
    @@renderer = new_renderer
  end
end
