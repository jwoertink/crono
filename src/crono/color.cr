module Crono
  struct Color
    # R, G, B, A
    WHITE = {255, 255, 255, 255}
    GRAY = {128, 128, 128, 255}
    BLACK = {0, 0, 0, 255}
    RED = {255, 0, 0, 255}
    ORANGE = {255, 171, 0, 255}
    YELLOW = {255, 255, 0, 255}
    LIME = {171, 255, 0, 255}
    GREEN = {0, 255, 0, 255}
    SPRING = {0, 255, 171, 255}
    CYAN = {0, 255, 255, 255}
    DODGER = {0, 171, 255, 255}
    BLUE = {0, 0, 255, 255}
    PURPLE = {171, 0, 171, 255}
    MAGENTA = {255, 0, 255, 255}
    PINK = {255, 0, 171, 255}
  
    alias RGBA = Tuple(Int32, Int32, Int32, Int32)
    alias RGB = Tuple(Int32, Int32, Int32)

    def self.to_hex(values : RGB) 
      to_hex({values[0], values[1], values[2], 255})
    end

    def self.to_hex(values : RGBA)
      "#%02X%02X%02X%02X" % values
    end

    # Returns `RGBA` with all non-zero values lowered by percent.
    # Does not change transparency
    def self.darken(values : RGBA, percent : Int32)
      numbers = [] of Int32
      numbers << (values[0] - (values[0] * percent) / 100)
      numbers << (values[1] - (values[1] * percent) / 100)
      numbers << (values[2] - (values[2] * percent) / 100)
      numbers << values[3]
      RGBA.from(numbers)
    end

    def self.lighten(values : RGBA, percent : Int32)
      numbers = [] of Int32
      numbers << (values[0] + (255 * percent) / 100)
      numbers << (values[1] + (255 * percent) / 100)
      numbers << (values[2] + (255 * percent) / 100)
      numbers << values[3]
      RGBA.from(numbers)
    end

    def self.rand
      RGB.from([rand(256), rand(256), rand(256)])
    end
  end
end
