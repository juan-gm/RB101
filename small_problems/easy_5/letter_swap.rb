def swap(string)
  arr = string.split
  arr.map! do |word| 
    aux = word[0]
    word[0] = word[-1]
    word[-1] = aux
    word
  end
  arr.join(' ')
end




puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'