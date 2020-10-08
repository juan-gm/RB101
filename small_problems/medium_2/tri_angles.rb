def triangle(a1, a2, a3)
  angles = [a1, a2, a3].sort
  return :invalid if invalid?(angles)
  return :right if right?(angles)
  return :acute if acute?(angles)
  :obtuse
end


def invalid?(angles)
  angles.inject(:+) != 180 || angles.any? { |angle| angle <= 0}
end

def right?(angles)
  angles.any? { |angle| angle == 90 }
end

def acute?(angles)
  angles[2] < 90
end


puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid