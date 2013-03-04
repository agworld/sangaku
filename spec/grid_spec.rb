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

    end

  end

end
