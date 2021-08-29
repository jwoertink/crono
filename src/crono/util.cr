require "colorize"

module Crono
  class Util
    include LuaCallable

    def debug(val)
      puts "DEBUG: #{val}".colorize(:yellow)
    end
  end
end
