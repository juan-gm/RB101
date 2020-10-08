# Input: Number n, which is at the same time the number of
# lights and the number of times you go through.

# Output: Array which identifies which lights are on after
# n repetitions.


# Structure: Array for the lights. Maybe a boolean to say
# which ones are off or on.


# Create an empty array.
# Fill it with false to imply that all lights are off at
# the beggining.

# Start 'walking' and turning off or on the switches.
#   - First round, turn everything on
#   - Second round, switch two multiples
#   - Third round, switch three multiples
#   - ...
# Iterate through the array to check which ones are on,
# and create a new array with the info

def on_lights(number)
  arr = Array.new(number, false)
  1.upto(number) do |round|
    1.upto(number) do |mult|
      arr[mult-1] = !arr[mult-1] if mult%round == 0
    end
  end
  arr
end

def switches_on(number)
  switches_info = on_lights(number)
  res = []
  switches_info.each_with_index do |item, index|
    res << index + 1 if item
  end
  res
end

p switches_on(10)




