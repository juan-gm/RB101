require 'pry'

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(word)
  blocks = BLOCKS.clone
  word.upcase.each_char do |char|
    return false if !is_included?(char, blocks)
    delete(char , blocks)
  end
  true
end

def is_included?(char, blocks)
  blocks.each do |pack|
    return true if pack.include?(char)
  end
  false
end

def delete(char, blocks)
  blocks.select! do |pack|
    #binding.pry
    !pack.include?(char)
  end
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true


