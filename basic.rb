require 'gosu'
require_relative 'tile'
require_relative 'player'
require_relative 'map'

class Basic < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Basic Gosu"
    @map = Map.new("media/map2.txt")
    @player = Player.new(30, 30, false, @map.tiles)
    @move_x = 0
  end

  def update
    close if button_down?(Gosu::KbEscape)
    #@player.move(@move_x)
    @move_x = 0
    #@player.update
  end

  def draw
   @player.draw
   @map.tiles.each {|t| t.draw}
  # @monster.draw
  end

  def button_down(id)
    if id == Gosu::KbRight
      @move_x = :right
    end
    if id == Gosu::KbLeft
      @move_x = :left
    end
    if id == Gosu::KbUp
      @move_x = :up
    end
    if id == Gosu::KbDown
      @move_x = :down
    end
  end
end


window = Basic.new
window.show
