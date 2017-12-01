class Tiles
  attr_reader :x, :y, :type
  def initialize(x, y, type)
    @x = x
    @y = y
    @icon = Gosu::Font.new(30)
    @type = type
  end

  def draw
    case @type
      when :wall
        @icon.draw("#", @x, @y, 1)
      when :exit
        @icon.draw(">", @x, @y, 1)
      when :key
        @icon.draw("K", @x, @y, 1)
    end
  end

end
