module Crono
  struct Color
    # R, G, B, A
    WHITE = SF::Color.new(0xFFFFFFffu32)
    GRAY = SF::Color.new(0xAAAAAAffu32)
    BLACK = SF::Color.new(0x000000ffu32)
    RED = SF::Color.new(0xFF0000ffu32)
    ORANGE = SF::Color.new(0xFFAA00ffu32)
    YELLOW = SF::Color.new(0xFFFF00ffu32)
    LIME = SF::Color.new(0xAAFF00ffu32)
    GREEN = SF::Color.new(0x00FF00ffu32)
    SPRING = SF::Color.new(0x00FFAAffu32)
    CYAN = SF::Color.new(0x00FFFFffu32)
    DODGER = SF::Color.new(0x00AAFFffu32)
    BLUE = SF::Color.new(0x0000FFffu32)
    PURPLE = SF::Color.new(0xAA00AAffu32)
    MAGENTA = SF::Color.new(0xFF00FFffu32)
    PINK = SF::Color.new(0xFF00AAffu32)
  
    #alias RGBA = SF::Color
    #alias RGB = Tuple(Int32, Int32, Int32)

    # Converts an RGB color value to HSL. Conversion formula
    # adapted from http://en.wikipedia.org/wiki/HSL_color_space.
    # Values are 0.0 .. 1.0
    def self.rgb_to_hsl(r : Float, g : Float, b : Float) : {Float64, Float64, Float64}
      max, min = {r, g, b}.max, {r, g, b}.min
      l = (max + min) / 2

      if max == min
        return {0.0, 0.0, l} # achromatic
      end

      d = max - min
      s = l > 0.5 ? d / (2 - max - min) : d / (max + min)
      h = case max
        when r
          (g - b) / d + (g < b ? 6 : 0)
        when g
          (b - r) / d + 2
        else
          (r - g) / d + 4
      end
      h /= 6

      {h, s, l}
    end

    def self.hue_to_rgb(p : Float, q : Float, t : Float) : Float64
      t %= 1
      if t < 1/6.0
        p + (q - p) * 6 * t
      elsif t < 3/6.0
        q
      elsif t < 4/6.0
        p + (q - p) * (2/3.0 - t) * 6
      else
        p
      end
    end

    # Converts an HSL color value to RGB. Conversion formula
    # adapted from http://en.wikipedia.org/wiki/HSL_color_space.
    # Values are 0.0 .. 1.0
    def self.hsl_to_rgb(h : Float, s : Float, l : Float) : {Float64, Float64, Float64}
      if s == 0.0
        return {l, l, l} # achromatic
      end

      q = l < 0.5 ? l * (1 + s) : l + s - l * s
      p = 2 * l - q
      {hue_to_rgb(p, q, h + 1/3.0),
       hue_to_rgb(p, q, h),
       hue_to_rgb(p, q, h - 1/3.0)}
    end

    #def self.to_hex(values : RGB) 
    #  to_hex({values[0], values[1], values[2], 255})
    #end

    #def self.to_hex(values : RGBA)
    #  "#%02X%02X%02X%02X" % values
    #end

    ## Returns `RGBA` with all non-zero values lowered by percent.
    ## Does not change transparency
    #def self.darken(values : RGBA, percent : Int32)
    #  numbers = [] of Int32
    #  numbers << (values[0] - (values[0] * percent) / 100)
    #  numbers << (values[1] - (values[1] * percent) / 100)
    #  numbers << (values[2] - (values[2] * percent) / 100)
    #  numbers << values[3]
    #  RGBA.from(numbers)
    #end

    #def self.lighten(values : RGBA, percent : Int32)
    #  numbers = [] of Int32
    #  numbers << (values[0] + (255 * percent) / 100)
    #  numbers << (values[1] + (255 * percent) / 100)
    #  numbers << (values[2] + (255 * percent) / 100)
    #  numbers << values[3]
    #  RGBA.from(numbers)
    #end

    #def self.rand
    #  RGB.from([rand(256), rand(256), rand(256)])
    #end

    #macro [](hex_value)
    #  SF::Color.new(0x{{ hex_value.id }}u32)
    #end
  end
end
