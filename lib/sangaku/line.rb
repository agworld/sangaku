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

    def length
      Math.sqrt(vx ** 2 + vy ** 2)
    end

    def vx
      p2.x - p1.x
    end

    def vy
      p2.y - p1.y
    end

    def get_x(y)
      ratio = p1.y != p2.y ? (y-p1.y)/(p2.y-p1.y).to_f : 0.5
      p1.x + ratio * (p2.x-p1.x)
    end
    def get_y(x)
      ratio = p1.x != p2.x ? (x-p1.x)/(p2.x-p1.x).to_f : 0.5
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
      (self.vx * other.vx + self.vy * other.vy)/(self.length * other.length)
    end

    def cross(other)
      self.vx * other.vy - self.vy * other.vx
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
