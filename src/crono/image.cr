module Crono
  # class Image
  #   alias TSize = Tuple(Int32, Int32)
  #   alias Sprite = NamedTuple(image: SDL::Texture, clip: SDL::Rect)
  #   alias Tiles = Array(Sprite)
  #   @sdl_img : SDL::Texture
  #   property src, dimentions

  #   # Returns Array(NamedTuple)
  #   # The total number of sprites would be
  #   # (img.full_width / dimentions[0]) * (img.full_height / dimentions[1])
  #   def self.load_tiles(src : String, dimentions : TSize)
  #     sprite = self.new(src, dimentions)
  #     sprites = [] of Sprite
  #     cols = (sprite.full_width / dimentions[0]).floor
  #     rows = (sprite.full_height / dimentions[1]).floor
  #     cols.times do |c|
  #       rows.times do |r|
  #         x = c * dimentions[0]
  #         y = r * dimentions[1]
  #         sprites.push({image: sprite.sdl, clip: SDL::Rect[x, y, dimentions[0], dimentions[1]]})
  #       end
  #     end
  #     sprites
  #   end

  #   def initialize(@src : String, @dimentions : TSize)
  #     @sdl_img = init_sdl_img
  #   end

  #   def initialize(@src : String)
  #     @sdl_img = init_sdl_img
  #     @dimentions = {1,1}
  #   end

  #   # returns the width you want
  #   def width
  #     @dimentions[0]?
  #   end

  #   # returns the full width of the image
  #   def full_width
  #     sdl.width
  #   end

  #   # returns the height you want
  #   def height
  #     @dimentions[1]?
  #   end

  #   # returns the full height of the image
  #   def full_height
  #     sdl.height
  #   end

  #   # TODO: find a better name for this proxy method
  #   def sdl
  #     @sdl_img
  #   end

  #   private def init_sdl_img
  #     ext = File.extname(@src)[1..-1]
  #     #NOTE: If loading a .bmp, should it be init somehow?
  #     if ["jpg", "png", "tif"].includes?(ext)
  #       SDL::IMG.init(SDL::IMG::Init.parse(ext))
  #       SDL::IMG.load(@src, Crono.renderer.not_nil!.sdl)
  #     else
  #       bmp = SDL.load_bmp(@src)
  #       bmp.color_key = {255, 0, 255}
  #       SDL::Texture.from(bmp, Crono.renderer.sdl)
  #     end
  #   end
  # end
end
