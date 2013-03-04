require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Sangaku

  describe Line do

    it 'should have a width and height' do
      line = Line.new([10, 20], [15, 10])
      line.w.should eq(5)
      line.h.should eq(10)
      line.to_s.should eq("(10, 20)->(15, 10)")
    end

    it 'should be possible to test boundary' do
      line = Line.new([10, 20], [15, 10])
      line.contain?.should eq(true)
      line.contain?(9).should eq(false)
      line.contain?(12).should eq(true)
      line.contain?(16).should eq(false)
      line.contain?(nil, 15).should eq(true)
      line.contain?(12, 15).should eq(true)
    end

    context "#get_x" do
      it "should return half point for lines running along the same x" do
        line = Line.new([5,1], [9,1])
        line.get_x(Point.new(3,1)).should eq(7)
        line.get_x(1).should eq(7)
      end
      it "should return the point itself for lines that are a point" do
        line = Line.new([5,1], [5,1])
        line.get_x(Point.new(1,1)).should eq(5)
      end

    end

    context "#get_y" do
      it "should return half point for lines running along the same y" do
        line = Line.new([1,5], [1,9])
        line.get_y(Point.new(1,3)).should eq(7)
        line.get_y(1).should eq(7)
      end
      it "should return the point itself for lines that are a point" do
        line = Line.new([1,5], [1,5])
        line.get_y(Point.new(1,1)).should eq(5)
      end
    end

  end

end
