require 'pry'

def merge_sort(array)
  halves = halvsies(array)
  
  merge(halves[0], halves[1])
end

def halvsies(array)
  half = array.size / 2 - 1 if array.size.even?
  half = array.size / 2 if array.size.odd?
  counter = 0
  first_half = []
  second_half = []
  while counter < array.size
    first_half << array[counter] if counter <= half
    second_half << array[counter] if counter > half
    counter += 1
  end
  should_return = first_half.size < 2 && second_half.size < 2
  return [first_half, second_half] if should_return
  [halvsies(first_half), halvsies(second_half)]
end

def merge(array1, array2)
  #binding.pry

  return array1 if array2 == nil
  return array2 if array1 == nil

  array1 = merge(array1[0], array1[1]) if array1.size != 1
  array2 = merge(array2[0], array2[1]) if array2.size != 1

  return array1 if array2 == nil
  return array2 if array1 == nil

  solution = []
  counter1 = 0
  counter2 = 0

  while counter1 < array1.size || counter2 < array2.size
    if array1[counter1] == nil
      min = array2[counter2]
    elsif array2[counter2] == nil
      min = array1[counter1]
    else
      min = [array1[counter1], array2[counter2]].min
    end
    
    solution << min
    counter1 += 1 if array1[counter1] == min
    counter2 += 1 if array2[counter2] == min
  end

  solution
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

=begin
Write a method that takes an Array as an argument,
and returns two Arrays (as a pair of nested Arrays)
that contain the first half and second half of the
original Array, respectively. If the original array
contains an odd number of elements, the middle element
should be placed in the first half Array.


Official solution:
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

=end



=begin
Input: An array of values
Output:  Either a copy of the input of the input itself
but ordered using merge sort.

Algorithm:
- Break the array into nested sub-arrays. Recursive!


- Merge the nested arrays one by one


=end