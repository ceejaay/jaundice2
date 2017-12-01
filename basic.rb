require 'gosu'
require_relative 'tile'
require_relative 'player'
require_relative 'map'

class Basic < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Basic Gosu"
    @map = Map.new("media/map2.txt")
    @actors =[]
    @move_x = 0
    @actors << Player.new(30, 60)
    @player = Player.new(30, 30, false, @map.tiles, @actors)
    puts @player.monster
    @message = Gosu::Font.new(15)
  end

  def update
    close if button_down?(Gosu::KbEscape)
    @player.move(@move_x)
    @move_x = 0
  end

  def draw
   @player.draw
   @actors.each {|a| a.draw}
   @map.tiles.each {|t| t.draw}
   @message.draw("#{@player.monster?(0, -30)}", 300, 30, 1)
  # @monster.draw
  end

  def button_down(id)
    if id == Gosu::KbRight
      @move_x = :right
      puts @player.monster?(30, 0)
    end
    if id == Gosu::KbLeft
      @move_x = :left
      puts @player.monster?(-30, 0)
    end
    if id == Gosu::KbUp
      @move_x = :up
      puts @player.monster?(0, -30)
    end
    if id == Gosu::KbDown
      @move_x = :down
      puts @player.monster?(0, 30)
    end
  end
end


window = Basic.new
window.show
