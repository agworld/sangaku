module Sangaku

  class Grid

    def initialize(xs, ys)
      @xs, @ys = xs, ys
    end

    def get_stars(poly)
      stars = []

      @xs.each do |x|
        ys = poly.select(x, nil).map { |line| line.get_y(x) }
        next if ys.length % 2 != 0
        stars += ys.sort.each_slice(2).map do |s|
          height = s.reduce(:-).abs
          y = 0.5 * s.reduce(:+)
          xs = poly.select(nil, y).map { |line| line.get_x(y) }
          xs.sort!
          s = xs.zip(xs.rotate).find { |a, b| x.between?(a, b) }
          width = 2 * [(x-s[0]).abs, (x-s[1]).abs].min
          Star.new([x, y], [width, height])
        end
      end

      @ys.each do |y|
        xs = poly.select(nil, y).map { |line| line.get_x(y) }
        next if xs.length % 2 != 0
        stars += xs.sort.each_slice(2).map do |s|
          width = s.reduce(:-).abs
          x = 0.5 * s.reduce(:+)
          ys = poly.select(x, nil).map { |line| line.get_y(x) }
          ys.sort!
          s = ys.zip(ys.rotate).find { |a, b| y.between?(a, b) }
          height = 2 * [(y-s[0]).abs, (y-s[1]).abs].min
          Star.new([x, y], [width, height])
        end
      end

      stars
    end

  end

end