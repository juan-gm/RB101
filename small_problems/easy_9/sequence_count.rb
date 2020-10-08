def sequence(count, first)
  arr = []
  multiply_by = 1
  while multiply_by <= count
    arr[multiply_by - 1] = first * multiply_by
    multiply_by += 1
  end
  arr
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []