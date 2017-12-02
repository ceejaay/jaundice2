class Tiles
  attr_reader :x, :y, :type
  def initialize(x, y, type, graphic)
    @x = x
    @y = y
    @icon = Gosu::Font.new(30)
    @type = type
    @graphic = Gosu::Image.load_tiles("media/map_tile.png", 30, 30)
  end

  def draw
    case @type
      when :wall
        if @visible
          @graphic[0].draw(@x, @y, 1)
        elsif @hazy
          @graphic[2].draw(@x, @y, 1)
        else
        end
      when :exit
        @graphic[0].draw(@x, @y, 1)
      when :key
        @graphic[0].draw(@x, @y, 1)
    end
  end

  def visibility(status)
    if status == :visible
      @visible = true
    end
    if status == :hazy
      @visible = false
      @hazy = true
    end
    if status == :invisible
      @visible = false
      @hazy = false
    end
  end
end
