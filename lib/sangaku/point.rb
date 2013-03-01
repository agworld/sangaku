module Sangaku

  class Point

    def initialize(x, y)
      @coord = [x, y]
    end

    def self.convert(points)
      points.map { |p| Point.new(*p) }
    end

    def x; @coord[0]; end
    def x=(val); @coord[0]=val; end
    def y; @coord[1]; end
    def y=(val); @coord[1]=val; end

    alias_method :w, :x
    alias_method :w=, :x=
    alias_method :h, :y
    alias_method :h=, :y=

    def +(other)
      Point.new(self.x + other.x, self.y + other.y)
    end

    def -(other)
      Point.new(self.x - other.x, self.y - other.y)
    end

    def *(scale)
      Point.new(self.x * scale,  self.y * scale)
    end

    def /(scale)
      Point.new(self.x / scale,  self.y / scale)
    end

    def dist(other)
      Math.sqrt((self.x - other.x) ** 2 + (self.y - other.y) ** 2 )
    end

    def to_a; @coord; end
    def to_s; "(#{@coord.join(', ')})"; end
    alias_method :inspect, :to_s

  end

end
