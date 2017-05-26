module Crono
  module GameMath
    
    def offset_x(theta : Int32, magnitude : Float64)
      radians = theta * Math::PI / 180
      magnitude * Math.cos(radians)
    end

    def offset_y(theta : Int32, magnitude : Float64)
      radians = theta * Math::PI / 180
      magnitude * Math.sin(radians)
    end
  end
end
