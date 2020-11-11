all_words = []
File.open("words.txt", "r") do |f|
  f.each_line do |line|
    all_words << line.chomp.split(' ')
  end
end

hash = {}
hash[:adjectives] = all_words[0]
hash[:nouns] = all_words[1]
hash[:verbs] = all_words[2]
hash[:adverbs] = all_words[3]


puts "The #{hash[:adjectives].sample} brown #{hash[:nouns].sample} #{hash[:adverbs].sample}
#{hash[:verbs].sample} the #{hash[:adjectives].sample} yellow
#{hash[:nouns].sample}, who #{hash[:adverbs].sample} #{hash[:verbs].sample} his
#{hash[:nouns].sample} and looks around."



