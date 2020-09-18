def reverse_sentence(word)
  ar = word.split
  rev = []
  ar.each {|x| rev.unshift(x)}
  rev.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
