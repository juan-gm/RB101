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

def palindromes(string)
  all_substrings = substrings(string)
  all_substrings.each_with_object([]) do |substring, palindromes|
    palindromes << substring if (substring == substring.reverse) && substring.length > 1
  end
end


puts palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]