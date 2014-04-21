class Amidakuji

  # number of vertical/column and horizontal/rung will be given
  # @param vertical [Fixnum] Number of vertical lines
  # @param horizontal [Fixnum] Number of horizontal lines
  def initialize(column, rung)
    @column = column
    @rung = rung
    @accumulated_arr = []
    #@per_arr = []
  end

  def permutate
    arr = (1..@column).to_a
    arr.permutation(@column).to_a
  end

  def build_initial
    @accumulated_arr[0] = (1..@column).to_a
  end

  def left_over(minuend, subtrahend)
     minuend.delete  subtrahend
     minuend
  end

  def swap_element
    swapped_arr= []
    i = 0
    while i < @column - 1 do
      arr = build_initial
      new_a = swap(arr, i)
      swapped_arr << new_a
      i += 1
    end
    swapped_arr
  end

  def swap_item(arr)
    (0...arr.size).each_cons(2).map do |i,j|
      a = arr.dup
      a[i], a[j] = a[j], a[i]
      a
    end
  end

  def subtract_arr
    left_arr = []
    permutate_arr = permutate
    initial_arr = build_initial
    # use left_over_arr for loop until there is nothing in the arr
    left_over_arr = left_over(permutate_arr, initial_arr)
    if left_over_arr.length > 0
    # store first swapped element to accumulated_arr[1]
    @accumulated_arr[1] = stage1 = swap_element
    final = left_over(permutate_arr - stage1, initial_arr)
    end
    final
  end

  def result
    left_over_arr = [] # possible array left
    stage_arr =[] # where you collect array for each stage/rung
    permutate_arr = permutate # all possible arrays
    my_arr =[]
    third_stage = []
    left_over_arr1 = []
    left_over_arr2 = []
    # add initial array to stage_arr
    # next gives [[1, 2, 3]]
    stage_arr << build_initial
    # use left_over_arr for loop until there is nothing in the arr
    # first delete initial array [1, 2, 3]
    # next gives [[1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    left_over_arr = left_over(permutate_arr, build_initial)
    # find second stage array [[2,1,3],[1,3,2]]
    second_stage = swap_item(build_initial)
    # next gives lines 1 rung, [[1, 2, 3], [[2, 1, 3], [1, 3, 2]]]
    stage_arr <<  second_stage
    # next gives [[2, 3, 1], [3, 1, 2], [3, 2, 1]]
    # delete second_stage from left_over_arr which gives [[2, 3, 1], [3, 1, 2], [3, 2, 1]]
    left_over_arr1 = left_over_arr - second_stage
    # find third stage
    second_stage.each { |e| third_stage << swap_item(e)}
    # next gives [[1, 2, 3], [2, 3, 1], [3, 1, 2]]
    third_stage = third_stage.flatten(1).uniq
    # add to stage_arr
    stage_arr << third_stage
    # next gives [[2, 3, 1], [3, 1, 2], [3, 2, 1]]
    left_over_arr2 = left_over_arr1 - third_stage
    left_over_arr2
    stage_arr << left_over_arr2
    stage_arr[2].count
    # next gives [[1, 2, 3], [2, 3, 1], [3, 1, 2]]
    # stage_arr.each{ |e| my_arr << swap_item(e)}
   # my_arr.flatten(1).uniq

    #while left_over_arr.length > 0 do
   # # store first swapped element to accumulated_arr[1], etc
   # # by using initial array and then swapped array
   # # each of arr(initial or second arr) swap again to get next arr
   # # find next swapped arr called stage
    #  stage_arr.each{ |e| swap_item(e).each{ |i| my_arr  << i  }  }
     # my_arr.uniq.each { |a| stage_arr << a  }
     # left_over_arr = permutate_arr - stage_arr
   # # add them to @accumulated_arr
     # @accumulated_arr << stage_arr
   # # delete them from left_over_arr
      #left_over_arr = left_over(left_over_arr, stage_arr)
   # # repeat it
    #end
    # outputs @accumulated_arr by array index 1: ...
    #@accumlated_arr
  end

  def swap(arr, a)
    if arr[a] < arr[a + 1]
      arr[a], arr[a + 1] = arr[a + 1], arr[a]
    end
    arr
  end

  def swaptwo(arr)
    (0...arr.length - 1).map{ |i| arr.dup.tap{ |a| a[i, 2] = a[i, 2].reverse }}
  end

end
