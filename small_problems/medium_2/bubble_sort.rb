require 'pry'

def bubble_sort!(array)
  
  counter = 0
  modification = false
  loop do
    modification = false if counter == 0
    if array[counter] > array[counter + 1]
      array[counter], array[counter + 1] = array[counter + 1], array[counter]
      modification = true
    end

    counter += 1
    #binding.pry
    if counter == array.size - 1
      #binding.pry
      counter = 0
      break if !modification
    end
  end
end




# Infinite loop iterating through the array
#   Compare consecutive numbers
#     if num2 > num1, we interchange them
  
#   Check if we haven't done ANY modification. If not,
#   we break from the loop. If yes, we try again.
#     end
  
  


array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

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