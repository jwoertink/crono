module Crono
  # class Song
  #   @sdl : SDL::Mix::Music
  #   delegate playing?, paused?, to: @sdl

  #   def initialize(@src : String)
  #     @sdl = SDL::Mix::Music.new(@src)
  #   end

  #   def play
  #     return if playing?
  #     @sdl.play
  #   end

  #   def pause
  #     return if paused?
  #     @sdl.pause
  #   end

  #   def resume
  #     return if playing?
  #     @sdl.resume
  #   end

  #   # Toggle music between playing and pausing
  #   def toggle
  #     if paused?
  #       resume
  #     elsif playing?
  #       pause
  #     else
  #       play
  #     end
  #   end

  #   def stop
  #     resume if paused?
  #     @sdl.stop
  #   end
  # end
end
