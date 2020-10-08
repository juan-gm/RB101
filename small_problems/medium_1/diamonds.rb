require 'pry'
def diamond(num)
  asterisks = 1
  spaces = num/2
  while asterisks <= num && spaces > 0
    paint(spaces, asterisks)
    asterisks += 2
    spaces -= 1
  end
  
  while asterisks > 0
    paint(spaces, asterisks)
    asterisks -= 2
    spaces += 1
  end
end


def paint(spaces, asterisks)
  puts " " * spaces + "*" * asterisks + " " * spaces
end

diamond(1)
diamond(3)
diamond(9)