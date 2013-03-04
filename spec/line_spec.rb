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

    it 'should be possible to do dot products yo' do
      line1 = Line.new([10, 10], [20, 20])
      line2 = Line.new([30, 30], [50, 50])
      line3 = Line.new([20, 20], [40, 0])
      line4 = Line.new([30, 30], [40, 30])
      line1.dot(line2).should be_within(1e-6).of(1)
      line2.dot(line1).should be_within(1e-6).of(1)
      line1.dot(line3).should be_within(1e-6).of(0)
      line3.dot(line2).should be_within(1e-6).of(0)
      line4.dot(line2).should be_within(1e-6).of(0.5*Math.sqrt(2.0))
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
