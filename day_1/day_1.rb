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

    if turn == 'R' 
      multi = turn_right
    elsif turn == 'L' 
      multi = turn_left
    end
    @location = Location.new(
      multi[0] * steps.to_i + @location.x,
      multi[1] * steps.to_i + @location.y)
  end
  def turn_right
    if @face == 'North'
      @face = 'East'
      return [1, 0]
    elsif @face == 'East'
      @face = 'South'
      return [0, -1]
    elsif @face == 'South'
      @face = 'West'
      return [-1, 0]
    elsif @face == 'West'
      @face = 'North'
      return [0, 1]
    end
  end
  def turn_left
    if @face == 'North'
      @face = 'West'
      return [-1, 0]
    elsif @face == 'East'
      @face = 'North'
      return [0, 1]
    elsif @face == 'South'
      @face = 'East'
      return [1, 0]
    elsif @face == 'West'
      @face = 'South'
      return [0, -1]
    end
  end
end
