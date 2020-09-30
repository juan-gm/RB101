def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?")