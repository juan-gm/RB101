def century(year)
  cent = year / 100
  if (year.to_s[-1] != '0' || year.to_s[-2] != '0')
    cent += 1
  end
  cent = cent.to_s
  if (cent[-1] == "3") && (cent[-2] != "1")
    return cent + "rd"
  elsif (cent[-1] == "2") && (cent[-2] != "1")
    return cent + "nd"
  elsif (cent[-1] == "1") && (cent[-2] != "1")
    return cent + "st"
  else
    return cent + "th"
  end
end


puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256)  == '3rd'
puts century(5)    == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
