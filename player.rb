class Player
  attr_reader :x, :y, :tiles, :enemy_array
  def initialize(x, y, tiles=[], enemy_array=[])
    @x = x
    @y = y
    @icon = Gosu::Font.new(30)
    @tiles = tiles
    @enemy_array = enemy_array
  end
  def draw
    if @monster
      @icon.draw("A", @x, @y, 1)
    else
      @icon.draw("@", @x, @y, 1)
    end
  end

  def update
  end

  def move(direction)
    if direction == :right
      if solid?(30, 0)
        @x += 0
      elsif monster?(30, 0)
        attack
      else
        @x += 30
      end
    end
    if direction == :left
      if solid?(-30, 0)
        @x -= 0
      elsif monster?(-30, 0)
          attack
      else
        @x -= 30
      end
    end
    if direction == :up
      if solid?(0, -30)
        @y -= 0
      elsif monster?(0, -30)
        attack
      else
        @y -= 30
      end
    end
    if direction == :down
      if solid?(0, 30)
        @y += 0
      elsif monster?(0, 30)
          attack
      else
        @y += 30
      end
    end
  end

  def solid?(offset_x, offset_y)
    @tiles.each do |tile|
      return true if (@x + offset_x)  / 30 == tile.x / 30 and (@y + offset_y) / 30 == tile.y / 30
    end
    false
  end

  def monster?(offset_x, offset_y)
    @enemy_array.each do |enemy|
        return true if (@x + offset_x)  / 30 == enemy.x / 30 and (@y + offset_y) / 30 == enemy.y / 30
    end
    false
  end

  def attack
    puts "Attacking!"
  end

end
