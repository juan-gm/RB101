def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  return :invalid if invalid?(sides)
  return :equilateral if equilateral?(sides)
  return :isosceles if isosceles?(sides)
  :scalene
end

def invalid?(sides)
  return true if sides[0] + sides[1] <= sides[2]
  return true if sides.any? { |side| side <= 0}
  false
end

def equilateral?(sides)
  sides[0] == sides[1] && sides[1] == sides[2]
end

def isosceles?(sides)
  sides[1] == sides[2]
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
  