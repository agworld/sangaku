require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

def test_splat(a, b)
  a + b
end

module Sangaku

  describe Point do

    it "should be useful" do
      point = Point.new(100, 200)
      point.x.should eq(100)
      point.y.should eq(200)
      test_splat(*point).should eq(300)
      point.x = 20
      point.y = 30
      point.to_s.should eq("(20, 30)")
    end

    it "should be possible to measure separation" do
      p1 = Point.new(10, 20)
      p2 = Point.new(15, 10)
      delta = p2-p1
      delta.w.should eq(5)
      delta.h.should eq(-10)
    end

    it "should be possible to measure distance" do
      p1 = Point.new(10, 13)
      p2 = Point.new(14, 10)
      p1.dist(p2).should eq(5)
    end

  end

end
