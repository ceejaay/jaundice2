class Monster
  attr_reader :x, :y
  def initialize(x, y, graphic)
    @x = x
    @y = y
    @graphic = graphic
    @icon = Gosu::Font.new(30)
  end

  def draw
    @graphic[8].draw(@x, @y, 1)
  end
end
