def stringy(int, add = 1)
  result = add.to_s
  counter = 1
  if (add == 1)
    while counter < int
      result.insert(-1, '0') if counter.odd?
      result.insert(-1, '1') if counter.even?
      counter += 1
    end
  else
    while counter < int
      result.insert(-1, '1') if counter.odd?
      result.insert(-1, '0') if counter.even?
      counter += 1
    end
  end
  result
end


puts stringy(6,0) == '010101'
puts stringy(9,0) == '010101010'
puts stringy(4,0) == '0101'
puts stringy(7,0) == '0101010'