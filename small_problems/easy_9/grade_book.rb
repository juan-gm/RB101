def get_grade(g1, g2, g3)
  mean = (g1 + g2 + g3)/3.0
  case
  when mean >= 90
    return 'A'
  when mean >= 80
    return 'B'
  when mean >= 70
    return 'C'
  when mean >= 60
    return 'D'
  end
  'F'
end

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"

