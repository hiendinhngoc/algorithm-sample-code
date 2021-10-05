class MergeSort
  def sort(array)
    num_elements = array.length
    return array if num_elements <= 1

    half_of_elements = num_elements / 2

    left_array = array.take(half_of_elements)
    right_array = array.drop(half_of_elements)
    p left_array
    p right_array

    sorted_left = sort(left_array)
    sorted_right = sort(right_array)

    merge(sorted_left, sorted_right)
  end

  def merge(left_array, right_array)
    return left_array if right_array.empty?

    return right_array if left_array.empty?

    smallest_number = if left_array.first < right_array.first
                        left_array.shift
                      else
                        right_array.shift
                      end
    merged = merge(left_array, right_array)
    [smallest_number].concat(merged)
  end

  # Compressed solution with sugar syntax
  # def sort(arr)
  #   return arr unless arr.size > 1
  #     mid = arr.size/2
  #     a, b, sorted = merge_sort(arr[0...mid]), merge_sort(arr[mid..-1]), []
  #     sorted << (a[0] < b[0] ? a.shift : b.shift) while [a,b].none?(&:empty?)
  #   sorted + a + b
  # end
end

test = MergeSort.new
p test.sort([2,3,5,8,6,9,7,4,1])