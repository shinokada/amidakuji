require 'spec_helper'

describe Amidakuji do

  context 'when vertical number is three' do
    before (:each) do
      @kuji1 = Amidakuji.new(3, 2)
      @kuji2 = Amidakuji.new(4, 2)
      @arr1 = @kuji1.build_initial
    end

    it 'should display permutated array' do
      expect(@kuji1.permutate).to eq ([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
    end

    it 'should return [1, 2, 3]' do
      expect(@kuji1.build_initial).to eq([1, 2, 3]) 
    end

    it 'should count 6' do
      expect(@kuji1.permutate.count).to eq (6) 
    end
   
    it '#swap should swap first and second element[2, 1, 3]' do
      expect(@kuji1.swap(@arr1, 0)).to eq ([2, 1, 3])
    end

    it '#swap_element should create an array with swapped elements [[2, 1, 3], [1, 3, 2]]' do
      expect(@kuji1.swap_element).to eq ([[2, 1, 3], [1, 3, 2]])
    end

    it '#swaptwo should swap two element of array and return array as above' do
      expect(@kuji1.swaptwo(@arr1)).to eq([[2,1,3],[1,3,2]])
    end

    it '#subtract_arr should be an array permutate_arr without initial_arr and stage1/swap_element [[2, 3, 1], [3, 1, 2], [3, 2, 1]]' do
      expect(@kuji1.subtract_arr).to eq ([[2, 3, 1], [3, 1, 2], [3, 2, 1]])
    end

    it '@kuji2 should count 20 array items after subtract_arr' do
      expect(@kuji2.subtract_arr.count).to eq (20)
    end

    it '@kuji1#swap_item should be [[2,1,3],[1,3,2]]' do
      expect(@kuji1.swap_item(@arr1)).to eq ([[2,1,3],[1,3,2]])
    end
    
    it '#result should return all array' do
      expect(@kuji1.result).to eq([[2,1,3],[1,3,2]])
    end
  end
end
