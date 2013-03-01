module Sangaku

  class AABB

    def initialize(*points)
      points = Point::convert(points)
      xs = points.map { |p| p.x }
      ys = points.map { |p| p.y }
      @line = Line.new([xs.min, ys.min], [xs.max, ys.max])
    end

    def min; @line.p1; end
    def max; @line.p2; end
    def mid; @line.mid; end

    def w; @line.w; end
    def h; @line.h; end

    def centre!(point = [0, 0])
      point = Point.new(*point) if point.is_a?(Array)
      @line -= (@line.mid - point)
    end

    def square!
      mid = @line.mid
      ds = 0.5 * [w, h].max
      @line.p1.x = mid.x - ds
      @line.p1.y = mid.y - ds
      @line.p2.x = mid.x + ds
      @line.p2.y = mid.y + ds
    end

    def *(scale)
      mid = @line.mid
      dx = 0.5 * w * scale
      dy = 0.5 * h * scale
      AABB.new([mid.x - dx, mid.y - dy], [mid.x + dx, mid.y + dy])
    end

    def to_grid(count = 5)
      raise if count < 2
      xs = (min.x..max.x).step(w/(count-1).to_f)
      ys = (min.y..max.y).step(h/(count-1).to_f)
      Grid.new(xs.to_a, ys.to_a)
    end

    def to_a; @line.to_a; end
    def to_s; @line.to_s; end
    alias_method :inspect, :to_s

  end

end
