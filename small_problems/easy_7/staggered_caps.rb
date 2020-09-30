def staggered_case(string)
  result = ''
  counter = 0
  string.chars.each do |letter|
    if counter % 2 == 0
      result << letter.upcase 
      counter += 1 if letter =~ /[a-z]/i
    elsif counter % 2 != 0
      result << letter.downcase 
      counter += 1 if letter =~ /[a-z]/i
    end
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'