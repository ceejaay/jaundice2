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
        elsif @visible == false  and @hazy == true
          @graphic[2].draw(@x, @y, 1)
        end
      when :exit
        if @hazy
          @graphic[5].draw(@x, @y, 1)
        elsif @visible
          @graphic[1].draw(@x, @y, 1)
        end
      when :key
        if @hazy
          @graphic[4].draw(@x, @y, 1)
        elsif @visible
          @graphic[3].draw(@x, @y, 1)
        end
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
