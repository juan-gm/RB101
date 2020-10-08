def twice(number)
  if number.to_s.size.odd?
    number * 2
  elsif double_number?(number)
    number
  else
    number * 2
  end
end

def double_number?(num)
  num__left_ends = num.to_s.size/2 - 1
  num_right_starts = num.to_s.size/2
  left_half = num.to_s[0..num__left_ends]
  right_half = num.to_s[num_right_starts..-1]
  left_half == right_half
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10