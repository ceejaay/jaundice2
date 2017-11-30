require 'gosu'
require_relative 'tile'
require_relative 'player'

class Basic < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Basic Gosu"
    @monster = Player.new(120, 60)
    puts @monster.x
    puts @monster.y
    @tiles = [ Tiles.new(90, 30), Tiles.new(30, 30), Tiles.new(30, 60), Tiles.new(30, 90), Tiles.new(60, 30)]
    @obstacles = @tiles.dup
    @obstacles << @monster
    @player = Player.new(60, 60, false, @obstacles)
    @move_x = 0
  end

  def update
    close if button_down?(Gosu::KbEscape)
    @player.move(@move_x)
    @move_x = 0
    @player.update
  end

  def draw
   @player.draw
   @tiles.each {|t| t.draw}
   @monster.draw
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
