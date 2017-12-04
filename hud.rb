class Hud
  def initialize(window, graphic)
    @window = window
    @width = @window.width
    @height = @window.height
    @graphic = graphic
# an image to be a frame.
#@frame = Gous::Image.new("media/frame.png")
    #@selector_dot = Gosu::Image.new("media/dot.png")
  end

  def update

  end

  def draw
    Gosu.draw_rect(0, @width, @width, -@height * 0.2, Gosu::Color::WHITE, 1)
    Gosu.draw_rect(10, @width - 10, @width - 20, -100, Gosu::Color::BLACK, 5)
    @graphic[10].draw(30, 530, 99)
    #@image.draw(lower, center, 1)
#@selector_dot.draw(draw when needed.)
  end



end
