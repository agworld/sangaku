require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Sangaku

  describe AABB do

    it "should just work" do
      aabb = AABB.new([1, 5], [3, 1], [5, -3])
      aabb.min.to_s.should eq("(1, -3)")
      aabb.max.to_s.should eq("(5, 5)")
      aabb.mid.to_s.should eq("(3.0, 1.0)")
      aabb.w.should eq(4)
      aabb.h.should eq(8)
      aabb.centre!
      aabb.mid.to_s.should eq("(0.0, 0.0)")
      aabb.w.should eq(4)
      aabb.h.should eq(8)
      aabb *= 0.5
      aabb.to_s.should eq("(-1.0, -2.0)->(1.0, 2.0)")
      aabb.square!
      aabb.mid.to_s.should eq("(0.0, 0.0)")
      aabb.w.should eq(4)
      aabb.w.should eq(4)
    end

  end

end
