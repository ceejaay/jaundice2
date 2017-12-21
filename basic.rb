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
    @actors << @player
    @message = Gosu::Font.new(15)
    @hud = Hud.new(self, @graphics, @player)
    @turn_number = 0
  end

  def update
    close if button_down?(Gosu::KbEscape)
    @player.update
    if @player.turn
      @player.move(@move_x)
      @player.turn_change
      @actors[0].turn_change
      @actors.rotate!
      @player.stat_adjustment(@turn_number)
      @move_x = 0
    end
    @player.stat_adjustment(@turn_number)
    if @actors[0].class == Monster and @actors[0].turn
      @actors[0].auto_move
      @actors[0].turn_change
      @actors.rotate!
      @actors[0].turn_change
    end
  end

  def draw
   @player.draw
   @actors.each {|a| a.draw}
   @map.tiles.each {|t| t.draw}
   @hud.draw
   @message.draw("#{@turn_number}", 400, 30, 1)
  end

  def button_down(id)
    if id == Gosu::KbRight
      @move_x = :right
      @player.turn_change
      @turn_number += 1
    end
    if id == Gosu::KbLeft
      @move_x = :left
      @player.turn_change
      @turn_number += 1
    end
    if id == Gosu::KbUp
      @move_x = :up
      @player.turn_change
      @turn_number += 1
    end
    if id == Gosu::KbDown
      @move_x = :down
      @player.turn_change
      @turn_number += 1
    end
    if id == Gosu::KbI
      @hud.menu
    end

    if id == Gosu::KbW
      puts "waiting"
      @player.turn_change
      @turn_number += 1
    end
  end
end


window = Basic.new
window.show
