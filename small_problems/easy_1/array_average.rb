def average(arr)
  int = 0
  arr.each { |x| int += x }
  int.to_f / arr.size
end

puts average([1, 6]) == 3.5 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25.66666666666666666666667
puts average([9, 47, 23, 95, 16, 52]) == 40.333333333333333
