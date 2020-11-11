def star(number)
  initial_space = 0
  medium_space = 2 + (number.to_f - 7)/2
  while medium_space >= 0
    starting_space = " " * initial_space
    space_in_between = " " * medium_space
    puts starting_space + "*" + space_in_between + "*" + space_in_between + "*"
    medium_space -= 1
    initial_space += 1
  end
  puts "*" * number

  initial_space -= 1
  while initial_space >= 0
    medium_space += 1
    starting_space = " " * initial_space
    space_in_between = " " * medium_space
    puts starting_space + "*" + space_in_between + "*" + space_in_between + "*"
    initial_space -= 1
  end
  puts "----------------------"
end

star(7)
star(9)
star(11)


# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# star(11)
# *    *    * 
#  *   *   *
#   *  *  *
#     * * *
#     ***
#   ***********
#     ***
#     * * *
#   *  *  *
#   *   *   *
   