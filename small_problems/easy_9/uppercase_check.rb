DOWNCASE = 'abcdefghijklmnopqrstuvwxyz'

def uppercase?(string)
  string.each_char do |char|
    return false if DOWNCASE.include?(char)
  end
  true
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true