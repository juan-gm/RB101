print "What is your name? "
name = gets.chomp
arr = name.chars
message = "Hello #{name.capitalize}."

if arr[arr.size - 1] == '!'
  puts "#{message.upcase} WHY ARE WE SCREAMING?"
else
  puts message
end


