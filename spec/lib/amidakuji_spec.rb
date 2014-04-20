require 'spec_helper'

describe Amidakuji do

  context 'when vertical number is three' do
    before (:each) do
      @kuji1 = Amidakuji.new(3, 2)
      @arr1 = @kuji1.build_initial
    end

    it 'should return [1, 2, 3]' do
      expect(@kuji1.build_initial).to eq([1, 2, 3]) 
    end

    it 'should count 6' do
      expect(@kuji1.permutate.count).to eq (6) 
    end
   
    it 'should swap first and second element' do
      expect(@kuji1.swap(@arr1, 0)).to eq ([2, 1, 3])
    end

    it 'should create an array with swapped elements' do
      expect(@kuji1.swap_element).to eq ([[2, 1, 3], [1, 3, 2]])
    end

    it 'should swap two element of array and return array' do
      expect(@kuji1.swaptwo(@arr1)).to eq([[2,1,3],[1,3,2]])
    end
  #specify{ expect(@arr.swap(0, 1)).to eq([2, 1, 3, 4]) }
  end
end
