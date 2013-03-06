require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Sangaku

  describe Grid do

    context "#get_stars" do

      it "should fail gracefully for an open poly" do
        xs = [1,4,7]
        ys = [1,3,5]
        grid = Grid.new(xs,ys)
        poly = Polygon.new([1,1],[4,4],[7,2])
        expect { grid.get_stars(poly) }.to raise_error(Errors::OpenPolygonError)
      end

      it "should work for a poly that folds back on itself" do
        xs = [1,2,3,4,5]
        ys = [1,2,3,4,5]
        grid = Grid.new(xs,ys)
        poly = Polygon.new([1,1],[1,4],[1,3],[2,2],[4,1])
        poly.close!
        grid.get_stars(poly)
      end

    end

  end

end
