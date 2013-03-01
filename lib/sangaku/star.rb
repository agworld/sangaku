module Sangaku

  class Star

    include Comparable

    def initialize(center, size)
      @center, @size = Point.new(*center), Point.new(*size)
    end

    def center
      @center
    end

    def fitness
      @fitness ||= (@size.w * @size.h)/(1+0.1*(@size.w-@size.h).abs)
    end

    def <=>(other)
      other.fitness <=> fitness
    end

  end

end
