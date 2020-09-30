ALL_CHARS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

LENGTHS = [8, 4, 4, 4, 12]

def gen_uuid
  str = ''
  LENGTHS.each do |num|
    count = 0
    while count < num
      n = ALL_CHARS.sample
      str << n
      count += 1
    end
    str << '-'
  end
  str.delete_suffix!('-')
  str
end

puts gen_uuid
