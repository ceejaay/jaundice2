class Player
  attr_reader :x, :y, :tiles, :enemy_array, :meld, :health, :turn
  def initialize(x, y, graphic, tiles=[], enemy_array=[])
    @x = x
    @y = y
    @graphic = graphic
    @icon = Gosu::Font.new(30)
    @tiles = tiles
    @enemy_array = enemy_array
    @meld = 19
    @health = 75
    @turn = true
    @visibility = true
  end
  def draw
    @graphic[6].draw(@x, @y, 100)
  end

  def update
    @tiles.each do |tile|
      tile.visibility(distance_from_player(tile.x, tile.y))
    end
    @enemy_array.each do |enemy|
      #check for monster because all monsters and player are in one array in the main game file
      if enemy.class == Monster
        enemy.visibility(distance_from_player(enemy.x, enemy.y))
      end
    end
  end

  def move(direction)
    if @turn
      if direction == :right
        if solid?(30, 0)
          @x += 0
          turn_change
        elsif monster?(30, 0)
          attack
          turn_change
        else
          @x += 30
          turn_change
        end
      end
      if direction == :left
        if solid?(-30, 0)
          @x -= 0
          turn_change
        elsif monster?(-30, 0)
            attack
            turn_change
        else
          @x -= 30
          turn_change
        end
      end
      if direction == :up
        if solid?(0, -30)
          @y -= 0
          turn_change
        elsif monster?(0, -30)
          attack
          turn_change
        else
          @y -= 30
          turn_change
        end
      end
      if direction == :down
        if solid?(0, 30)
          @y += 0
          turn_change
        elsif monster?(0, 30)
          attack
          turn_change
        else
          @y += 30
          turn_change
        end
      end
    end
  end

  def turn_change
    if @turn
      @turn = false
    else
      @turn = true
      end
  end

  def solid?(offset_x, offset_y)
    @tiles.each do |tile|
      if (@x + offset_x)  / 30 == tile.x / 30 and (@y + offset_y) / 30 == tile.y / 30
        return true unless tile.type == :key or tile.type == :exit
      end
    end
    false
  end

  def monster?(offset_x, offset_y)
    @enemy_array.each do |enemy|
        return true if (@x + offset_x)  / 30 == enemy.x / 30 and (@y + offset_y) / 30 == enemy.y / 30
    end
    false
  end

  def distance_from_player(x, y)
    return Gosu.distance(@x, @y, x, y)
  end

  def attack
    puts "Attacking!"
  end

  def stat_adjustment(turn)
    current_turn = turn
    if current_turn % 10 == 0 and current_turn != 0
      @health -= 1
      end
  end
end
