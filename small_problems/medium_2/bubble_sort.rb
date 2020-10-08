# def bubble_sort!(array)
#   n = array.length
#   loop do
#     newn = 0
#     for index in 1..n-1
#       if array[index - 1] > array[index]
#         array[index - 1], array[index] = array[index], array[index - 1]
#         newn = index
#       end
#     end
#     n = newn
#     break if n <= 1
#   end
# end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)