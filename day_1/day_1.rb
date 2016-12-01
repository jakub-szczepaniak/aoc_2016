def d(x1, y1, x2, y2)
  (y2 - y1).abs + (x2 - x1).abs
end

class Location
  def initialize(x, y)
    @x = x
    @y = y
  end

  def taxi(x, y)
    d(@x, @y, x, y)
  end
end
