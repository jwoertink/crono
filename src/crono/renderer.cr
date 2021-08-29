module Crono
  # class Renderer
  #   @sdl_renderer : SDL::Renderer
  #   delegate clear, to: @sdl_renderer
  #   property animation_counter : UInt16

  #   def initialize(window : SDL::Window)
  #     @sdl_renderer = SDL::Renderer.new(window)
  #     @animation_counter = 0_u16
  #   end

  #   def sdl
  #     @sdl_renderer
  #   end

  #   def color=(color)
  #     sdl.draw_color = color
  #     sdl.clear
  #     color
  #   end

  #   def color
  #     sdl.draw_color
  #   end

  #   # Draws an image
  #   def draw(image : Image, location : Tuple(Int32, Int32), angle = 0)
  #     #sdl.viewport = {location[0], location[1], image.width, image.height}
  #     sdl.copy(image.sdl, nil, SDL::Rect[location[0], location[1], image.width, image.height], angle)
  #   end

  #   # Draws some text
  #   def draw(font : Font, location : Tuple(Int32, Int32))
  #     surface = font.draw
  #     sdl.copy(surface, dstrect: SDL::Rect[location[0], location[1], surface.width, surface.height])
  #   end

  #   # Draws an image for the current animation
  #   def animate(image_sprites, location : Tuple(Int32, Int32))
  #     count = image_sprites.size
  #     @animation_counter = 0_u16 if @animation_counter >= count
  #     sprite = image_sprites[@animation_counter]
  #     image = sprite[:image]
  #     sdl.copy(image, sprite[:clip], SDL::Rect[location[0], location[1], sprite[:clip].w, sprite[:clip].h])
  #     @animation_counter += 1
  #   end
  # end
end
