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
end