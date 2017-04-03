module Crono
  class Font
    property text : String
    property color : Crono::Color::TColor
    
    def initialize(@path : String, @font_size : Int32)
      @text = ""
      @color = Crono::Color::BLACK
      @sdl_font = SDL::TTF::Font.new(@path, @font_size)
    end

    def draw
      @sdl_font.render_solid(text, color)
    end
  end
end
