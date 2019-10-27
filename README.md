# ![crono](logo.gif) crono [![Build Status](https://travis-ci.com/jwoertink/crono.svg?branch=master)](https://travis-ci.com/jwoertink/crono)

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

"Hello World" example.

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

  def draw
    brush.draw(@main_text, {100, 75})
  end

end

new_game = MyGameWindow.new(640, 480)
new_game.title = "My Super cool game"

# Call this method to boot the game
new_game.show
```

Check out some [Sample Games](https://github.com/jwoertink/crono-samples)

## Crono::Window

This is the class that your main class will inherit from. `Crono::Window` gives you lots of important methods.

* `initialize` - It's still crystal, so you can override this. Just be sure to call `initialize(width, height)` in it.
* `after_init` - This method is called after SDL has had a chance to set things up.
* `draw` - Define this method to draw to the screen
* `update` - Define this method to update calulcations and such for the next draw to make
* `key_pressed(key)` - This method is called when a key is pressed.
* `key_down(key)` - This method is called when a key is down.
* `key_up(key)` - This method is called when a key is released.

To boot your game, you will instantiate your custom game window class that inherits from `Crono::Window`. 
```
new_game = MyGameWindow.new(640, 480)
```

Then give it a title with `new_game.title = "Whatever your game is called"`
Finally you call the show method `new_game.show`.


### Colors
Crono has a few [built in colors](https://github.com/jwoertink/crono/blob/master/src/crono/color.cr#L4) you can use.

```crystal
class MyGameWindow < Crono::Window
  def draw
    brush.draw(background_color, {0, 0})
  end

  private def background_color
    Crono::Color.darken(Crono::Color::BLUE, 30)
  end
end
```


## Development

Help me understand SDL, and write some specs. 
Most importantly, need to figure out how to make animation smooth.

## Contributing

1. Fork it ( https://github.com/jwoertink/crono/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jwoertink](https://github.com/jwoertink) Jeremy Woertink - creator, maintainer
