arr = []

puts "Enter the 1st number: "
arr << gets.chomp.to_i

puts "Enter the 2st number: "
arr << gets.chomp.to_i

puts "Enter the 3st number: "
arr << gets.chomp.to_i

puts "Enter the 4st number: "
arr << gets.chomp.to_i

puts "Enter the 5st number: "
arr << gets.chomp.to_i

puts "Enter the 6st number: "
obj = gets.chomp.to_i

flag = false
arr.each do |x|
  if x == obj
    flag = true
  end
end

if flag
  puts "The number #{obj} appears in #{arr}"
else
  puts "The number #{obj} does not appear in #{arr}"
end
