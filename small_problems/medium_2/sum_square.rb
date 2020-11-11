# Input: number n

# Output: difference of ..

# We need to calculate 2 things.

# (n + n-1 + n-2 + n-3 + n-4...) - (1² + 2² + 3³ + ... + n²)

def sum_square_difference(num)
  sum_square = 0
  square_sum = 0
  1.upto(num) do |n| 
    sum_square += n
    square_sum += n**2
  end
  sum_square = sum_square ** 2
  sum_square - square_sum
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

  