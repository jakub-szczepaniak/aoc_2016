class Location
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def taxi(other)
    (other.y - @y).abs + (other.x - @x).abs
  end
end

class Position
  attr_reader :location, :face
  def initialize
    @location = Location.new(0, 0)
    @face = 'North'
  end

  def go(map_direction)
    turn, steps = map_direction.match(/(.)(.+)/).captures
    if turn == 'R'
      @face = 'East'
      @location = Location.new(steps.to_i + @location.x, 0)
    else
      @face = 'West'
      @location = Location.new(-steps.to_i + @location.x, 0)
    end
  end
end
