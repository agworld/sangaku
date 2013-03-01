module Sangaku

  class Line

    def initialize(p1, p2)
      @coords = Point::convert([p1, p2])
    end

    def p1; @coords[0]; end
    def p1=(val); @coords[0] = val; end
    def p2; @coords[1]; end
    def p2=(val); @coords[1] = val; end

    def w
      (p2.x - p1.x).abs
    end
    def h
      (p2.y - p1.y).abs
    end

    def get_x(y)
      ratio = (y-p1.y)/(p2.y-p1.y).to_f rescue 0.5
      p1.x + ratio * (p2.x-p1.x)
    end
    def get_y(x)
      ratio = (x-p1.x)/(p2.x-p1.x).to_f rescue 0.5
      p1.y + ratio * (p2.y-p1.y)
    end

    def +(point)
      Line.new(p1 + point, p2 + point)
    end
    def -(point)
      Line.new(p1 - point, p2 - point)
    end

    def mid
      (p1 + p2) * 0.5
    end

    def dot(other)
      self.x * other.x + self.y * other.y
    end

    def cross(other)
      self.x * other.y - self.y * other.x
    end

    def contain?(x = nil, y = nil)
      (x.nil? || x.between?(*[p1.x, p2.x].sort)) &&
      (y.nil? || y.between?(*[p1.y, p2.y].sort))
    end

    def to_a
      [@p1.to_a, @p2.to_a]
    end

    def to_s
      "#{p1}->#{p2}"
    end
    alias_method :inspect, :to_s

  end

end
