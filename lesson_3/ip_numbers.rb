def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  answer = true
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    answer = is_an_ip_number?(word)
    break unless answer
  end
  answer
end