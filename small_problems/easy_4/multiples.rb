def multisum(top)
  arr = []
  insert_multiples(3, arr, top)
  insert_multiples(5, arr, top)
  arr.uniq!
  arr.sum
end

def insert_multiples(num, arr, top)
  var = num
  while var <= top
    arr << var
    var += num
  end
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
puts multisum(20) == 98  