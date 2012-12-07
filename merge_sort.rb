require 'test/unit'

class MergeSortTest < Test::Unit::TestCase
	def test_it_return_itself_when_merge_sort_an_empty_array
		assert_equal [], mergeSort([])
	end

	def test_it_return_itself_when_merge_sort_an_single_element_array
		assert_equal [1], mergeSort([1])
	end

	def test_it_return_an_ordered_array_when_merge_sort_an_array
		mess = [ 10, 7, 3, 2, 1, 4, 6, 5, 9, 8 ]
		ordered = [1, 2, 3, 4, 5, 6, 7,  8, 9, 10]

		assert_equal ordered, mergeSort(mess)
	end
end

def mergeSort(array)
	return array if array.length <= 1

	half = array.length / 2
	part1 = array[0..half-1]
	part2 = array[half..-1]

	merge mergeSort(part1), mergeSort(part2)
end	

def merge(a, b)
	return a if b.empty?
	return b if a.empty?

	if a.first < b.first
		[a.first] + merge(a[1..-1], b)
	else
		[b.first] + merge(a, b[1..-1])
	end
end
