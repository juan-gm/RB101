def halvsies(arr)
  arr1 = []
  arr2 = []
  cut = (arr.size / 2.to_f).ceil
  arr.each_with_index do |item, index|
    arr1 << item if index < cut
    arr2 << item if index >= cut
  end
  res = []
  res << arr1
  res << arr2
  res
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]