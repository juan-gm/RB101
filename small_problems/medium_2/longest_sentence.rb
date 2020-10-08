require 'pry'

def longest_sentence(string)
  longest = -1
  counter = 0
  arr = string.split
  arr.each do |word|
    counter += 1
    if word[-1] == '.' || word[-1] == '?' || word[-1] == '!'
      longest = counter if counter > longest
      counter = 0
    end
  end
  longest
end

file = IO.read("book.txt")
puts longest_sentence(file)

