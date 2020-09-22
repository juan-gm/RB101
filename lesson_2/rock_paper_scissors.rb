VALID_CHOICES = %w(rock paper scissors lizard spock)
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
    all_choices = VALID_CHOICES.join(', ') + ", " + SHORT_CHOICES.keys.join(', ')
    prompt("Choose one: #{all_choices}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    elsif VALID_CHOICES.include?(SHORT_CHOICES[choice.to_sym])
      choice = SHORT_CHOICES[choice.to_sym]
      break
    else
      prompt("That's not a valid choice")
    end
  end
  choice
end

def continue?(score1, score2)
  if score1 != 5 && score2 != 5
    return true
  end
  prompt("Do you want another match?")
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    true
  else
    false
  end
end

def info_score(player_score, computer_score)
  prompt("Your score is #{player_score}")
  prompt("Computer score is #{computer_score}")
end

player_score = 0
computer_score = 0
system("clear")

loop do
  if player_score == 5 || computer_score == 5
    player_score = 0
    computer_score = 0
    system("clear")
  end

  player_choice = choice()
  computer_choice = VALID_CHOICES.sample
  puts "You chose: #{player_choice}; Computer chose: #{computer_choice}"

  result = display_result(player_choice, computer_choice)
  prompt(result)

  if result == "You won!"
    player_score += 1
  elsif result == "Computer won!"
    computer_score += 1
  end

  info_score(player_score, computer_score)
  grand_winner(player_score, computer_score)
  break if !continue?(player_score, computer_score)
end

prompt('Thank you for playing! Good bye')
