class Hud
  attr_reader :menu
  def initialize(window, graphic)
    @window = window
    @menu = false
    @width = @window.width
    @height = @window.height
    @graphic = graphic
    @text = Gosu::Font.new(30)
    @messages = Gosu::Font.new(20)
# an image to be a frame.
#@frame = Gous::Image.new("media/frame.png")
    #@selector_dot = Gosu::Image.new("media/dot.png")
  end

  def update

  end


  def draw
    if @menu
      Gosu.draw_rect(0, @width, @width, -@height * 0.2, Gosu::Color::WHITE, 1)
      Gosu.draw_rect(10, @width - 10, @width - 20, -100, Gosu::Color::BLACK, 5)
      #selctor dot
      @graphic[10].draw(390, 530, 99)
    else
      Gosu.draw_rect(0, @width, @width, -@height * 0.2, Gosu::Color::WHITE, 1)
      Gosu.draw_rect(10, @width - 10, @width - 20, -100, Gosu::Color::BLACK, 5)
      #weapon box brackets
      @graphic[11].draw(30, 515, 99)
      @graphic[11].draw(30, 575, 99, 1.0, -1.0)
      @graphic[11].draw(90, 515, 99, -1.0, 1.0)
      @graphic[11].draw(90, 575, 99, -1.0, -1.0)
# text info
      @text.draw("Health", 420, 500, 99 )
      @text.draw("MELD", 420, 530, 99 )
      @text.draw("40", 530, 530, 99 )
      @text.draw("90", 530, 500, 99 )
      @messages.draw("We'll write messages here", 120, 500, 99 )
      @messages.draw("so we'll know what's going on.", 120, 530, 99 )
    end
  end

  def menu
    if @menu
      @menu = false
    else
      @menu = true
    end
  end



end
