class Tiles
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @icon = Gosu::Font.new(30)
  end

  def draw
    @icon.draw("#", @x, @y, 1)
  end

end
