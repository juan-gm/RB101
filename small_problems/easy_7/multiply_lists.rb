def multiply_list(arr1, arr2)
  counter = 0
  result = []
  while counter < arr1.size
    num = arr1[counter] * arr2[counter]
    result << num
    counter += 1
  end
  result
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]