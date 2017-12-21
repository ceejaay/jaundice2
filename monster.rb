class Monster
  attr_reader :x, :y
  def initialize(x, y, graphic)
    @x = x
    @y = y
    @graphic = graphic
    @icon = Gosu::Font.new(30)
    @visible = false
    @hazy = false
    @turn = false
  end

  def turn_change
    if @turn
      @turn = false
      else
        @turn = true
      end
  end

  def draw
    if @visible
      @graphic[8].draw(@x, @y, 1)
    end
    if @hazy
      @graphic[9].draw(@x, @y, 1)
      end
  end

  def visibility(distance)
    if (30..60).include?(distance)
      @visible = true
      @hazy = false
    elsif (60..90).include?(distance)
      @visible = false
      @hazy = true
    end
  end
end
