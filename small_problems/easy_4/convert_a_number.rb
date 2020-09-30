CONVERSION = { 1 => '1',
               2 => '2',
               3 => '3',
               4 => '4',
               5 => '5',
               6 => '6',
               7 => '7',
               8 => '8',
               9 => '9',
               0 => '0'
}


def integer_to_string(int)
  arr = int.digits.reverse
  str = ''
  arr.each { |x| str << CONVERSION[x] }
  str
end

def signed_integer_to_string(num)
  return '0' if num == 0
  if num > 0
    return integer_to_string(num).prepend('+')
  else
    return integer_to_string(num.abs).prepend('-')
  end
end


puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'