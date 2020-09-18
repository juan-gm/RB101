require 'date'

puts "What is your age"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement = gets.chomp.to_i

present = Date.today.year
work = retirement - age

puts "It's #{present}. You will retire in #{present+work}"
puts "You have #{work} years to retire"