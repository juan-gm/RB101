VOWELS = %w(a e i o u A E I O U )

def remove_vowels(array)
  result = []
  array.each do |word|
    new_word = ''
    word.each_char do |char|
      new_word << char if !VOWELS.include?(char)
    end
    result << new_word
  end
  result
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']