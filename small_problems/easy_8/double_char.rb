def repeater(string)
  result = ''
  string.each_char do |char|
    result << char * 2
  end
  result
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''


IGNORE = ' aeiouAEIOU-124567890!.:'


def double_consonants(string)
  result = ''
  string.each_char do |char|
    if IGNORE.include?(char)
      result << char
    else
      result << char * 2
    end
  end
  result
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""