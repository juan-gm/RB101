def short_long_short(s1, s2)
  longest = s1
  shortest = s2
  if (longest.size < s2.size)
    longest = s2
    shortest = s1
  end
  shortest + longest + shortest
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"