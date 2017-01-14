# crono

Crono is (going to be) a 2d video game framework.

**NOTE** Under development still

## Installation

Include in your `shard.yml`

```yml
dependencies:
  crono:
    github: jwoertink/crono
    branch: master
```

## Usage

```crystal
require "crono"

class MyGameWindow < Crono::Window
  
end

MyGameWindow.new(640, 480).show
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/jwoertink/crono/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [jwoertink](https://github.com/jwoertink) Jeremy Woertink - creator, maintainer
