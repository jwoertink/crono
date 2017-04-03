require "sdl"
require "sdl/image"
require "sdl/ttf"
require "./crono/*"


SDL.init(SDL::Init::VIDEO)
SDL::TTF.init
at_exit { SDL.quit }
at_exit { SDL::IMG.quit }
at_exit { SDL::TTF.quit }

module Crono
  @@renderer : Crono::Renderer?

  def self.renderer
    @@renderer.not_nil!
  end

  def self.renderer=(new_renderer)
    @@renderer = new_renderer
  end
end
