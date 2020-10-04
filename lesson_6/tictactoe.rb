INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
VALID_YES_NO_INPUTS = %w(yes y no n)
FIRST_PLAYER = %w(computer player choose)

def prompt(message)
  puts "=> #{message}"
end

def clear
  system("clear")
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts "First to reach 5 points wins!"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  (1..9).each_with_object({}) { |num, board| board[num] = INITIAL_MARKER }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ', ', final = 'or')
  return arr[0].to_s if arr.size  == 1
  return arr.join(" #{final} ") if arr.size == 2
  final_string = ''
  arr.each_with_index do |item, index|
    if index < (arr.size - 1)
      final_string << item.to_s
      final_string << separator
    else
      final_string << final + " "
      final_string << item.to_s
    end
  end
  final_string
end

def is_integer?(num)
  num.to_f - num.to_i == 0.0
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))})")
    square = gets.chomp
    break if empty_squares(brd).include?(square.to_i) && is_integer?(square)
    prompt("Sorry, that's not a valid choice")
  end
  brd[square.to_i] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  victory = find_victory_square(brd)
  risk = find_at_risk_square(brd)
  square = empty_squares(brd).sample

  if victory != ''
    brd[victory] = COMPUTER_MARKER
  elsif risk != ''
    brd[risk] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    brd[square] = COMPUTER_MARKER
  end
end

def find_at_risk_square(brd)
  risk = ''
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each do |num|
        risk = num if brd[num] == INITIAL_MARKER
      end
    end
  end
  risk
end

def find_victory_square(brd)
  victory = ''
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each do |num|
        victory = num if brd[num] == INITIAL_MARKER
      end
    end
  end
  victory
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score(score, brd, winner)
  if winner == 'Player'
    score[:player] += 1
  elsif winner == 'Computer'
    score[:computer] += 1
  end
end

def info_score(score)
  prompt("Your score is #{score[:player]}")
  prompt("Computer score is #{score[:computer]}")
end

def grand_winner(score)
  if score[:player] == 5
    prompt("Congratulations! You are the grand winner!")
  elsif score[:computer] == 5
    prompt("You lost. Good luck next time!")
  end
end

def continue?(score)
  return true if (score[:player] != 5) && (score[:computer] != 5)
  loop do
    prompt("Do you want another match? " + VALID_YES_NO_INPUTS.join(', '))
    answer = gets.chomp
    if VALID_YES_NO_INPUTS.include?(answer.downcase)
      return answer.downcase.start_with?('y')
    else
      prompt("Please include a valid input")
    end
  end
end

def reset_score(score)
  if score[:computer] == 5 || score[:player] == 5
    score[:computer] = 0
    score[:player] = 0
  end
end

def place_piece!(board, current_player)
  if current_player == 'computer'
    computer_places_piece!(board)
  elsif current_player == "player"
    player_places_piece!(board)
  end
end

def alternate_player(current_player)
  return "computer" if current_player == "player"
  "player"
end

def choose_who_plays(possible_options)
  while true
    prompt("Choose who will go first: #{joinor(possible_options)}")
    player = gets.chomp
    break if possible_options.include?(player)
    prompt("Sorry, that was not a valid option")
  end
  player
end

def pause_game(score)
  if (score[:player] != 5) && (score[:computer] != 5)
    prompt("Press enter to continue the game")
    gets.chomp
  end
end

clear
score = { player: 0, computer: 0 }
first_to_play = choose_who_plays(FIRST_PLAYER)

loop do
  reset_score(score)
  board = initialize_board
  clear
  current_player = if first_to_play == "choose"
                     choose_who_plays(FIRST_PLAYER[0..1])
                   else
                     first_to_play
                   end

  loop do
    clear
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  clear
  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    prompt("#{winner} won!")
    update_score(score, board, winner)
    info_score(score)
    pause_game(score)
  else
    prompt("It's a tie!")
    info_score(score)
    prompt("Press enter to continue the game")
    gets.chomp
  end

  grand_winner(score)
  break if !continue?(score)
end

prompt "Thanks for playing Tic Tac Toe"
