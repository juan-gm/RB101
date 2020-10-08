def center_of(string)
  s = string.size
  if s % 2 == 0
    string[s/2 - 1] + string[s/2]
  else
    string[s/2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'