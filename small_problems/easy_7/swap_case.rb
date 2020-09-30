def swapcase(string)
  res = string.chars
  res.map! do |letter|
    if letter.upcase == letter && letter.downcase != letter.upcase
      letter.downcase
    elsif letter.downcase == letter && letter.downcase != letter.upcase
      letter.upcase
    else
      letter
    end
  end
  res.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'