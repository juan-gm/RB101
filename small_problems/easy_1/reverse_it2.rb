def reverse_words(word)
  ar = word.split
  res = []
  ar.each do |x|
    if x.length > 4
      rev = x.reverse
      res.push(rev)
    else
      res.push(x)
    end
  end
  res.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS