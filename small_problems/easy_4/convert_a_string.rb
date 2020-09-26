STRING_TO_NUM = { '0' => 0,
                  '1' => 1,
                  '2' => 2,
                  '3' => 3,
                  '4' => 4,
                  '5' => 5,
                  '6' => 6,
                  '7' => 7,
                  '8' => 8,
                  '9' => 9 }

STRING_TO_HEX = { '0' => 0,
                  '1' => 1,
                  '2' => 2,
                  '3' => 3,
                  '4' => 4,
                  '5' => 5,
                  '6' => 6,
                  '7' => 7,
                  '8' => 8,
                  '9' => 9, 
                  'A' => 10,
                  'B' => 11,
                  'C' => 12,
                  'D' => 13,
                  'E' => 14,
                  'F' => 15,
                  'a' => 10,
                  'b' => 11,
                  'c' => 12,
                  'd' => 13,
                  'e' => 14,
                  'f' => 15 }

def string_to_integer(string)
  digits = string.chars.map { |char| STRING_TO_HEX[char] }
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value

end

def hex_to_int(string)
  digits = string.chars.map { |char| STRING_TO_HEX[char] }
  digits.reverse!
  value = 0
  index = 0
  while index < digits.size
    value = (16**(index)) * digits[index] + value
    index += 1
  end
  value

end

puts string_to_integer('4321') == 4321
puts string_to_integer('570')  == 570

puts hex_to_int('4D9f') == 19871
