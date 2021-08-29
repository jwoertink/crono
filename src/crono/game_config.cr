module Crono
  class GameConfig
    property width : Int32
    property height : Int32
    property title : String

    def initialize(@width : Int32, @height : Int32, @title : String)
    end
  end
end
