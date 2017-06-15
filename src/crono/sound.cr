module Crono
  class Sound
    
    def initialize(@src : String, channel = 0)
      @sdl = SDL::Mix::Sample.new(@src)
      @channel = SDL::Mix::Channel.new(channel)
    end

    def play
      @channel.play(@sdl)
    end
  end
end
