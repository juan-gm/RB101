flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}

flintstones.each_with_index do |word, index|
  hsh[word] = index
end

puts hsh
