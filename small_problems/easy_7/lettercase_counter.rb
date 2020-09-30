
ALL = ('a'..'z').to_a.join + ('A'..'Z').to_a.join  

def letter_case_count(string)
  result = {}
  lowercase = string.count(('a'..'z').to_a.join)
  uppercase = string.count(('A'..'Z').to_a.join)
  neither = string.size - string.count(ALL)
  result[:lowercase] = lowercase
  result[:uppercase] = uppercase
  result[:neither] = neither
  result
end
puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }