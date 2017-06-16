![crono](logo.gif) crono

Crono is a 2d video game framework based around SDL2.

**NOTE** Still under development, but games can be sort of played now

The major part holding this back is animation is super choppy still. 

## Installation

Include in your `shard.yml`

```yml
dependencies:
  crono:
    github: jwoertink/crono
    branch: master
```

Be sure to have SDL2 installed!

### macOS

```
brew install sdl2
brew install sdl2_image
brew install sdl2_ttf
brew install sdl2_mixer --with-flac --with-fluid-synth --with-libmikmod --with-libmodplug --with-libvorbis --with-smpeg2
```

### Linux Debian


## Usage

```crystal
require "crono"

class MyGameWindow < Crono::Window
  @main_text : Crono::Font?
  
  def after_init
    font_path = File.join(__DIR__, "assets", "fonts", "lobster.ttf")
    @main_text = Crono::Font.new(font_path, 18)
    @main_text.color = Crono::Color::YELLOW
    @main_text.text = "Hello GameWorld"
  end

  def update
    @main_text.text = "Hello GameWorld #{Time.now}"
  end

  def draw
    brush.draw(background_color, {0, 0})
    brush.draw(@main_text, {100, 75})
  end

  def key_pressed(key)
    case key
    when .escape?
      close
    when .w?
      puts "move forward"
    when .a?
      puts "move left"
    when .s?
      puts "move back"
    when .d?
      puts "move right"
    end
  end

  private def background_color
    Crono::Color.darken(Crono::Color::BLUE, 30)
  end
end

new_game = MyGameWindow.new(640, 480)
new_game.title = "My Super cool game"
new_game.show
```

Check out some [Sample Games](https://github.com/jwoertink/crono-samples)

## Development

Help me understand SDL, and write some specs.

## Contributing

1. Fork it ( https://github.com/jwoertink/crono/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jwoertink](https://github.com/jwoertink) Jeremy Woertink - creator, maintainer
