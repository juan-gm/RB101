def titleize(string)
  arr = string.split
  arr.map! { |x| x.capitalize }
  arr.join(" ")
end

words = "the flintstones rock"
puts titleize(words)