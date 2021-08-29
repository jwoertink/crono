module Crono
  module GameMath
    def offset_x(angle : Float64, radius : Float64)
      Math.sin(angle / 180 * Math::PI) * radius
    end

    def offset_y(angle : Float64, radius : Float64)
      -Math.cos(angle / 180 * Math::PI) * radius
    end

    def distance(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64)
      Math.sqrt(distance_sqr(x1, y1, x2, y2))
    end

    def distance_sqr(x1 : Float64, y1 : Float64, x2 : Float64, y2 : Float64)
      square(x1 - x2) + square(y1 - y2)
    end

    def square(value : Int32 | Float64)
      value * value
    end
  end
end
