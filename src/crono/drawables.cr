module Crono
  class Drawables
    @renderables : Array(Tuple(Crono::Drawable, SF::RenderStates))
    delegate :each, to: @renderables
    
    def initialize
      @renderables = [] of Tuple(Crono::Drawable, SF::RenderStates)
    end

    def add(drawable : Crono::Drawable, states : SF::RenderStates)
      @renderables.push(Tuple.new(drawable, states))
    end

  end
end
