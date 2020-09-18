puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percentage = gets.chomp.to_f

tip = (bill * percentage / 100).round(2)
total = (bill + tip).round(2)

puts "The tip is #{format("%.2f",tip)} €"

puts  "The total is #{format("%.2f",total)} €"