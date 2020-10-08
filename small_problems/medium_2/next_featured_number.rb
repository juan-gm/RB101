def featured(num)
  counter = num
  loop do
    counter += 1
    break if counter % 7 == 0 && counter.odd?
  end
  return counter if featured?(counter)

  loop do
    counter += 14
    break if featured?(counter)
    break if counter > 9_876_543_210
  end
  return counter if featured?(counter)
  'There is no possible number that fulfills those requirements.'
end

def featured?(number)
  number.odd? && number.to_s.chars.uniq == number.to_s.chars
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements