require 'gosu'
require_relative 'tile'
require_relative 'player'
require_relative 'map'
require_relative 'monster'

class Basic < Gosu::Window
  def initialize
    super 600, 600
    self.caption = "Basic Gosu"
    @graphics = Gosu::Image.load_tiles("media/map_tile.png", 30, 30)
    @map = Map.new("media/map2.txt", @graphic)
    @actors = Array.new 
    @actors << Monster.new(60, 60, @graphics)
    @move_x = 0
    @player = Player.new(30, 30, @graphics, @map.tiles, @actors)
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
