def triangle(num)
  spaces = num - 1
  asterisks = 1
  while asterisks <= num
    puts " " * spaces + "*" * asterisks
    spaces -= 1
    asterisks += 1
  end
  puts
end

triangle(5)
triangle(9)