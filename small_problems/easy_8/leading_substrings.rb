def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end


p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']