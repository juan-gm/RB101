print "Please write word or multiple words: "
answer = gets.chomp

answer = answer.split

answer.map! { |x| x.chars}

puts answer.flatten.size

