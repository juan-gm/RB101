def swap_name(string)
  array = string.split
  array[1] + ', ' + array[0]
end

# Other way
def swap_name(name)
  name.split(' ').reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'