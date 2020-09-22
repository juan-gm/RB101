puts ">> Please enter an integer greater than 0: "

int = gets.chomp.to_i

puts ">> Enter 's' to compute the sum, 'p' to compute the product."

answer = gets.chomp



if answer == 's'
  result = 0
  1.upto(int) { |x| result += x }
else
  result = 1
  (1..int).step { |x| result *= x} 
end

puts result


