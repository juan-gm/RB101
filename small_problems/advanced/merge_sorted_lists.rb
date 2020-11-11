def merge(array1, array2)
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




  

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]