require "colorize"

module Crono
  class Util
    include LuaCallable

    def initialize(@renderer : SDL::Renderer)
    end

    def debug(val)
      puts "DEBUG: #{val}".colorize(:yellow)
    end

    def set_color(name) : Nil
      color = Crono::Color.from_name(name.as(String))
      @renderer.draw_color = color
    end

    def draw_rect(tl, tr, bl, br) : Nil
      @renderer.fill_rect(
        tl.as(Float64).to_i,
        tr.as(Float64).to_i,
        bl.as(Float64).to_i,
        br.as(Float64).to_i
      )
    end
  end
end
