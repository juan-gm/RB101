# def time_of_day(num)
#   mins = num % 60
#   hours = num / 60
#   while hours < 0
#     hours += 24
#   end
#   while hours > 23
#     hours -= 24
#   end
#   format('%02d:%02d', hours, mins)
  
# end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end


puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# def after_midnight(time)
#  hours = time[0..1].to_i
#  mins = time[3..4].to_i
#  total_mins = hours*60 + mins
#  total_mins -= 1440 if total_mins == 1440
#  total_mins
# end

# def before_midnight(time)
#   hours = time[0..1].to_i
#   mins = time[3..4].to_i
#   total_mins = hours*60 + mins
#   res = MINUTES_PER_DAY - total_mins
#   res -= 1440 if res == 1440
#   res
# end

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

puts ('------------')
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0