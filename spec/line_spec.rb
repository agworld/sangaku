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

  end

end
