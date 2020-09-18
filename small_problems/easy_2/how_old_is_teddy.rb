puts "What is the name?"
name = gets.chomp

name = "Teddy" if name.empty?


age = rand(181) + 20

puts "#{name.capitalize} is #{age} years old!"