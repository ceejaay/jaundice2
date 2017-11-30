class Player
  attr_reader :x, :y
  def initialize(x, y, monster=true, tiles=[])
    @x = x
    @y = y
    @icon = Gosu::Font.new(30)
    @tiles = tiles
    @monster = monster
  end
  def draw
    if @monster
      @icon.draw("A", @x, @y, 1)
    else
      @icon.draw("@", @x, @y, 1)
    end
    if ! @monster
      @icon.draw("Solid right: #{solid?(30, 0)}", 330, 30, 1)
      @icon.draw("Solid left: #{solid?(-30, 0)}", 330, 60, 1)
      @icon.draw("Solid up: #{solid?(0, -30)}", 330, 90, 1)
      @icon.draw("Solid down: #{solid?(0, 30)}", 330, 120, 1)
    end
  end
  def update
  end

  def move(direction)
    if direction == :right
      if solid?(30, 0)
        if monster?(30, 0)
          attack
        end
      else
        @x += 30
      end
    end
    if direction == :left
      if solid?(-30, 0)
        if monster?(-30, 0)
          attack
        end
      else
        @x -= 30
      end
    end
    if direction == :up
      if solid?(0, -30)
        if monster?(0, -30)
          attack
        end
      else
        @y -= 30
      end
    end
    if direction == :down
      if solid?(0, 30)
        if monster?(0, 30)
          attack
        end
      else
        @y += 30
      end
    end
  end

  def solid?(offset_x, offset_y)
    @tiles.each do |tile|
      return true if (@x + offset_x)  / 30 == tile.x / 30 and (@y + offset_y) / 30 == tile.y / 30
      #puts "Offset: #{@x + offset_x}, X: #{@x}"
    end
    false
  end

  def monster?(offset_x, offset_y)
    @tiles.each do |tile|
      if tile.class == Player
        return true if (@x + offset_x)  / 30 == tile.x / 30 and (@y + offset_y) / 30 == tile.y / 30
      end
    end
    false
  end

  def attack
    puts "Attacking!"
  end

end
