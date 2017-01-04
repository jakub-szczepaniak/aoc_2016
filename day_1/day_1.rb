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
  def initialize(face='North')
    @location = Location.new(0, 0)
    @face = face
  end

  def go(map_direction)
    turn, steps = map_direction.match(/(.)(.+)/).captures
    if turn == 'R' && face == 'North'
      @face = 'East'
      multi = 1
    elsif turn == 'L' && face == 'South'
      @face = 'East'
      multi = 1
    elsif turn == 'L' && face == 'North'
      @face = 'West'
      multi = -1
    elsif turn == 'R' && face == 'South'
      @face = 'West'
      multi = -1
    end
    @location = Location.new(multi * steps.to_i + @location.x, 0)
  end
end
