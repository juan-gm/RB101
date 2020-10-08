def substrings(string)
  res = []
  0.upto(string.size - 1) do |index|
    res << leading_substrings(string[index..string.size])
  end
  res.flatten
end



def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]