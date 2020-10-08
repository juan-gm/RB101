CONVERSION = { one: 1, two: 2, three: 3, 'four.' => '4.', five: 5,
               six: 6, seven: 7, eight: 8, nine: 9,
               zero: 0
              }


def word_to_digit(string)
  string.split.map do |word|
    word = CONVERSION[word] if CONVERSION[word] != nil
    word = CONVERSION[word.to_sym] if CONVERSION[word.to_sym] != nil
    word
  end.join(' ')
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'