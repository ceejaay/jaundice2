require 'gosu'
require_relative 'tile'
require_relative 'player'
require_relative 'map'
require_relative 'monster'
require_relative 'hud'

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
    @hud = Hud.new(self, @graphics, @player)
    @turn = 0
  end

  def update
    close if button_down?(Gosu::KbEscape)
    @player.update
    @player.move(@move_x)
    @move_x = 0
  end

  def draw
   @player.draw
   @actors.each {|a| a.draw}
   @map.tiles.each {|t| t.draw}
   @hud.draw
   @message.draw("#{@turn}", 400, 30, 1)
  end

  def button_down(id)
    if id == Gosu::KbRight
      @move_x = :right
      @turn += 1
    end
    if id == Gosu::KbLeft
      @move_x = :left
      @turn += 1
    end
    if id == Gosu::KbUp
      @move_x = :up
      @turn += 1
    end
    if id == Gosu::KbDown
      @move_x = :down
      @turn += 1
    end
    if id == Gosu::KbI
      @hud.menu
    end

    if id == Gosu::KbW
      puts "waiting"
      @turn += 1
    end
  end
end


window = Basic.new
window.show
