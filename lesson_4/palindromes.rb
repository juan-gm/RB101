def change_me(string)
  string = string.split
  counter = 0
  while counter < string.size
    if is_palindrome?(string[counter])
      string[counter].upcase!
    end
    counter += 1
  end
  string.join(' ')
end

def is_palindrome?(string)
  if string.downcase.reverse == string.downcase
    return true
  else
    false
  end
end

m = "We will meet at noon"
puts change_me(m) == "We will meet at NOON"
puts m
puts change_me("No palindromes here") == "No palindromes here"
puts change_me("") == ""
puts change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"