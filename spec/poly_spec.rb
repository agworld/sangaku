require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Sangaku

  describe Poly do

    it "should just work" do
      poly = Poly.new([1, 2], [3, 4], [5, 6])
      lines = poly.lines
      lines.length.should eq(2)
      poly.close!
      lines = poly.lines
      lines.length.should eq(3)
      lines[0].to_s.should eq("(1, 2)->(3, 4)")
      lines[1].to_s.should eq("(3, 4)->(5, 6)")
      lines[2].to_s.should eq("(5, 6)->(1, 2)")
      poly << [7, 8]
      poly.to_s.should eq("(1, 2)->(3, 4)->(5, 6)->(7, 8)")
    end

    it "should be possible to select lines" do
      poly = Poly.new([1, 2], [3, 4], [5, 6], [7, 8])
      poly.close!
      lines = poly.select(2)
      lines.length.should eq(2)
      lines[0].to_s.should eq("(1, 2)->(3, 4)")
      lines[1].to_s.should eq("(7, 8)->(1, 2)")
    end

    it "should be possible to get the bounding box" do
      poly = Poly.new([1, 7], [3, 4], [5, 6], [8, 2])
      aabb = poly.aabb
      aabb.min.to_s.should eq("(1, 2)")
      aabb.max.to_s.should eq("(8, 7)")
    end

  end

end
