def greetings(array, hsh)
  result = 'Hello, '
  array.each do |n|
    result << n
    result << ' '
  end
  result[-1] = '! '
  result << 'Nice to have a '
  result << hsh[:title]
  result << ' '
  result << hsh[:occupation]
  result << ' around.'
  result
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
#=> Hello, John Q Doe! Nice to have a Master Plumber around.