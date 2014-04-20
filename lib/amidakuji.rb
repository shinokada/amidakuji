class Amidakuji

  # number of vertical/column and horizontal/rung will be given
  # @param vertical [Fixnum] Number of vertical lines
  # @param horizontal [Fixnum] Number of horizontal lines
  def initialize(column, rung)
    @column = column
    @rung = rung
    @myarr = []
    @per_arr = []
    @build_arr = []
  end

  def permutate
    arr = (1..@column).to_a
    @per_arr = arr.permutation(@column).to_a
  end

  def build_initial
    @arr = (1..@column).to_a
  end

  def swap_element 
    i = 0
    while i < @column - 1 do
      arr = build_initial
      new_a = swap(arr, i)
      @build_arr << new_a
      i += 1
    end
    @build_arr
  end

  def swap(arr, a)
    if arr[a] < arr[a + 1]
      arr[a], arr[a + 1] = arr[a + 1], arr[a]
    end
    arr
  end

  def swaptwo(arr)
    (0...arr.length - 1).map{|i| arr.dup.tap{ |a| a[i, 2] = a[i, 2].reverse } }
  end

end
