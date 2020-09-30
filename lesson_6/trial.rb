def joinor(arr, separator = ', ', final = 'or')
  return arr[0].to_s if arr.size  == 1
  return "#{arr[0]} #{final} #{arr[1]}" if arr.size == 2
  final_string = ''
  arr.each_with_index do |item, index|
    if index < (arr.size - 1) 
      final_string << item.to_s
      final_string << separator
    else
      final_string << final + " "
      final_string << item.to_s
    end
  end
  final_string
end

puts joinor([1, 2])                   == "1 or 2"
puts joinor([1, 2, 3])                == "1, 2, or 3"
puts joinor([1, 2, 3], '; ')          == "1; 2; or 3"
puts joinor([1, 2, 3], ', ', 'and')   == "1, 2, and 3"