class Coordinates
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
  attr_reader :location, :face, :locations
  FACES = {
    'North' => [0, 1],
    'East' => [1, 0],
    'West' => [-1, 0],
    'South' => [0, -1]}
  def initialize(face = 'North', tracker = DefaultTracker.new)
    @location = Coordinates.new(0, 0)
    @face = face
    @locations = [@location]
  end

  def go(map_direction)
    turn, steps = map_direction.match(/(.)(.+)/).captures
    if turn == 'R' 
      multi = turn_right
    elsif turn == 'L' 
      multi = turn_left
    end
    @tracker.track(@location, steps.to_i, multi)
    @location = Coordinates.new(
      multi[0] * steps.to_i + @location.x,
      multi[1] * steps.to_i + @location.y)

  end

  def turn_right
    if @face == 'North'
      @face = 'East'
    elsif @face == 'East'
      @face = 'South'
    elsif @face == 'South'
      @face = 'West'
    elsif @face == 'West'
      @face = 'North'
    end
    FACES[@face]
  end

  def turn_left
    if @face == 'North'
      @face = 'West'
    elsif @face == 'East'
      @face = 'North'
    elsif @face == 'South'
      @face = 'East'
    elsif @face == 'West'
      @face = 'South'
    end
  end
end
