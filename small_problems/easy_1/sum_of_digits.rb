def sum(int)
  ar = int.to_s.split('')
  sum = 0
  ar.each { |x| sum += x.to_i }
  sum
end

# Other option

def easy_sum(int)
  int.to_s.split('').map!(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

puts easy_sum(23) == 5
puts easy_sum(496) == 19
puts easy_sum(123_456_789) == 45
