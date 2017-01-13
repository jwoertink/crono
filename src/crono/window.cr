module Crono
  class Window
    property width, height, title
    
    def initialize(width, height)
      self.width = width
      self.height = height
      self.title = "Sample"
    end

    def show
      @window = SDL::Window.new(title, width, height)
    end

  end
end
