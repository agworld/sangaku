module Sangaku

  class Poly

    def initialize(*points)
      @points = Point::convert(points)
      @lines = nil
      @closed = false
      @aabb = nil
    end

    def closed?
      @closed
    end

    def close!
      return if @closed
      @closed = true
      @lines = nil
      @aabb = nil
    end

    def clear!
      @points.clear
      @closed = false
      @lines = nil
      @aabb = nil
    end

    def length
      @points.length
    end

    def points
      @points
    end

    def lines
      @lines ||= _points_to_lines
    end

    def aabb
      @aabb ||= AABB.new(*@points)
    end

    def <<(p)
      @lines = nil
      @points << Point.new(*p)
    end

    def select(x = nil, y = nil)
      lines.select { |line| line.contain?(x, y) }
    end

    def to_a
      @points.map { |p| p.to_a }
    end

    def to_s
      @points.join('->')
    end
    alias_method :inspect, :to_s

    private

    def _points_to_lines
      return [] if @points.length < 2
      retval = @points.zip(@points.rotate).map { |p1, p2| Line.new(p1, p2) }
      retval = retval[0...-1] unless @closed
      retval
    end

  end

end
