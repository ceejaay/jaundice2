class Map
  attr_reader :tiles
  def initialize(file)
    @lines = File.readlines(file).map {|line| line.chomp}
    @width = @lines[0].length
    @height = @lines.length
    @tiles = []
    create_tiles
  end
   
  def create_tiles
    @height.times do |y|
      @width.times do |x|
        tile = @lines
        case @lines[y][x]
          when "#"
            @tiles << Tiles.new(x * 30, y * 30)
          #when "K"
          #  @tiles << Tile.new(x * 30, y * 30)
          #when "E"
          #  @tiles << Tile.new(x * 30, y * 30)
         end
      end
    end
  end

  def draw
    @tiles.each {|tile| tile.draw}
  end
end
