WIN_MOVES = { rock: %w(scissors lizard),
              paper: %w(rock spock),
              scissors: %w(paper lizard),
              lizard: %w(paper spock),
              spock: %w(scissors rock) }
SHORT_CHOICES = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  l: 'lizard',
                  sp: 'spock' }

VALID_YES_NO_INPUTS = %w(yes y no n)

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WIN_MOVES[first.to_sym].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def grand_winner(score1, score2)
  if score1 == 5
    prompt("Congratulations! You are the grand winner!")
  elsif score2 == 5
    prompt("You lost. Good luck next time!")
  end
end

def choice
  choice = ''
  loop do
    all_choices = SHORT_CHOICES.flatten.join(', ')
    prompt("Choose one: #{all_choices}")
    choice = gets.chomp
    if SHORT_CHOICES.values.include?(choice)
      break
    elsif SHORT_CHOICES.values.include?(SHORT_CHOICES[choice.to_sym])
      choice = SHORT_CHOICES[choice.to_sym]
      break
    else
      prompt("That's not a valid choice")
    end
  end
  choice
end

def continue?(score1, score2)
  return true if (score1 != 5) && (score2 != 5)
  loop do
    prompt("Do you want another match? " + VALID_YES_NO_INPUTS.join(', '))
    answer = gets.chomp
    if VALID_YES_NO_INPUTS.include?(answer)
      return answer.downcase.start_with?('y')
    else
      prompt("Please include a valid input")
    end
  end
end

def info_score(player_score, computer_score)
  prompt("Your score is #{player_score}")
  prompt("Computer score is #{computer_score}")
end

def reset_score(player_score, computer_score)
  if player_score == 5 || computer_score == 5
    player_score = 0
    computer_score = 0
    system("clear")
  end
  return player_score, computer_score
end

def calculate_score(result, player_score, computer_score)
  if result == "You won!"
    player_score += 1
  elsif result == "Computer won!"
    computer_score += 1
  end
  return player_score, computer_score
end

player_score = 0
computer_score = 0
system("clear")

loop do
  player_score, computer_score = reset_score(player_score, computer_score)
  player_choice = choice()
  system("clear")
  computer_choice = SHORT_CHOICES.values.sample
  puts "You chose: #{player_choice}; Computer chose: #{computer_choice}"

  result = display_result(player_choice, computer_choice)
  prompt(result)
  player_score, computer_score = calculate_score(result, player_score, computer_score)

  info_score(player_score, computer_score)
  grand_winner(player_score, computer_score)
  break if !continue?(player_score, computer_score)
end

system("clear")
prompt('Thank you for playing! Good bye')
