def crunch(string)
  arr = string.split
  res = arr.map do |word|
    count = 0
    while count < word.size
      if word[count] == word[count+1]
        word[count] = ''
      else
        count += 1
      end
    end
    word
  end
  res.join(' ')
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
