def rotate_array(arr)
  rotated = arr.clone
  temp = rotated.shift
  rotated.push(temp)
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, digits)
  arr = number.to_s.chars
  temp = arr.delete_at(-digits)
  arr.push(temp)
  arr.join.to_i
end


def max_rotation(num)
  max = num.to_s.size
  result = num
  while max > 1
    result = rotate_rightmost_digits(result, max)
    max -= 1
  end
  result
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845

