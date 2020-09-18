puts "What is the length and width of the room?"

puts "Length in meters"
length = gets.chomp.to_f

puts "Width in meters"
width = gets.chomp.to_f

area = length * width
feet = area * 10.7639

puts "The area of the room is #{area} sqm (#{feet} sqf)"
