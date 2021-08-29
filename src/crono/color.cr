module Crono
  struct Color
    # R, G, B, A
    WHITE   = SDL::Color[255]
    GRAY    = SDL::Color[128]
    BLACK   = SDL::Color[0]
    RED     = SDL::Color[255, 0, 0]
    ORANGE  = SDL::Color[255, 171, 0]
    YELLOW  = SDL::Color[255, 255, 0]
    LIME    = SDL::Color[171, 255, 0]
    GREEN   = SDL::Color[0, 255, 0]
    SPRING  = SDL::Color[0, 255, 171]
    CYAN    = SDL::Color[0, 255, 255]
    DODGER  = SDL::Color[0, 171, 255]
    BLUE    = SDL::Color[0, 0, 255]
    PURPLE  = SDL::Color[171, 0, 171]
    MAGENTA = SDL::Color[255, 0, 255]
    PINK    = SDL::Color[255, 0, 171]

    alias RGBA = SDL::Color
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

    macro [](r, g, b, a = 255)
      SDL::Color[{{r}}, {{g}}, {{b}}, {{a}}]
    end
  end
end
