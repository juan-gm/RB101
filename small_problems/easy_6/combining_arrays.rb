def merge(arr1, arr2)
  full = arr1 << arr2
  full.flatten!.uniq!
  full
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]