def interleave(arr1, arr2)
  combined = []
  counter = 0
  while combined.size < arr1.size * 2
    combined << arr1[counter]
    combined << arr2[counter]
    counter += 1
  end
  combined
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']