require 'date'

def friday_13th(year)
  counter = 0
  for num in 1..12
    date = Date.new(year, num, 13)
    counter += 1 if date.friday?
  end
  counter
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2