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
  
    alias TColor = Tuple(Int32, Int32, Int32, Int32)

    def self.to_hex(values : Tuple(Int32, Int32, Int32))
      to_hex({values[0], values[1], values[2], 255})
    end

    def self.to_hex(values : TColor)
      "#%02X%02X%02X%02X" % values
    end

    # Returns `TColor` with all non-zero values lowered by percent.
    # Does not change transparency
    def self.darken(values : TColor, percent : Int32)
      numbers = [] of Int32
      numbers << (values[0] - (values[0] * percent) / 100)
      numbers << (values[1] - (values[1] * percent) / 100)
      numbers << (values[2] - (values[2] * percent) / 100)
      numbers << values[3]
      TColor.from(numbers)
    end

    def self.lighten(values : TColor, percent : Int32)
      numbers = [] of Int32
      numbers << (values[0] + (255 * percent) / 100)
      numbers << (values[1] + (255 * percent) / 100)
      numbers << (values[2] + (255 * percent) / 100)
      numbers << values[3]
      TColor.from(numbers)
    end
  end
end
