ALL = ('a'..'z').to_a.join + ('A'..'Z').to_a.join  

def letter_percentages(string)
  result = {}
  size = string.size
  lowercase = string.count(('a'..'z').to_a.join)
  uppercase = string.count(('A'..'Z').to_a.join)
  neither = string.size - string.count(ALL)
  result[:lowercase] = lowercase * 100.0 / size
  result[:uppercase] = uppercase * 100.0 / size
  result[:neither] = neither * 100.0 / size
  result
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }