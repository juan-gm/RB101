SUITS = %w(Hearts Diamonds Clubs Spades)
VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
DECK = VALUES.product(SUITS)
VALID_YES_NO_INPUTS = %w(yes y no n)

def prompt(msg)
  puts "=> #{msg}"
end

def clear
  system("clear")
end

def joinor(arr, separator = ', ', final = 'and')
  return arr[0].to_s if arr.size == 1
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

def deal_cards(shuffled_deck, player_deck, dealer_deck)
  2.times do
    player_deck << shuffled_deck.pop
    dealer_deck << shuffled_deck.pop
  end
end

def show_info(player_cards, dealer_cards)
  prompt("Dealer has: #{dealer_cards[0][0]} and unknown card")
  values_of_player_cards = []
  player_cards.each { |card| values_of_player_cards << card[0] }
  prompt("You have: #{joinor(values_of_player_cards)}")
end

def show_full_info(player_cards, dealer_cards)
  values_of_dealer_cards = []
  dealer_cards.each { |card| values_of_dealer_cards << card[0] }
  prompt("Dealer has: #{joinor(values_of_dealer_cards)}")
  values_of_player_cards = []
  player_cards.each { |card| values_of_player_cards << card[0] }
  prompt("You have: #{joinor(values_of_player_cards)}")
end

def player_turn(player_cards, dealer_cards, shuffled_deck)
  loop do
    show_info(player_cards, dealer_cards)
    puts "hit or stay?"
    answer = gets.chomp
    if answer != 'hit' && answer != 'stay'
      puts "Only hit or stay are valid"
      next
    end
    player_cards << shuffled_deck.pop if answer == 'hit'
    break if answer == 'stay' || busted?(player_cards)
  end
  player_result(player_cards, dealer_cards)
end

def player_result(player_cards, dealer_cards)
  if busted?(player_cards)
    show_info(player_cards, dealer_cards)
    puts "Sorry, you busted!"
  else
    puts "You chose to stay!"
  end
end

def dealer_turn(dealer_cards, shuffled_deck)
  while total(dealer_cards) < 17
    dealer_cards << shuffled_deck.pop
  end
  puts "Dealer busted!" if busted?(dealer_cards)
end

def busted?(cards)
  total(cards) > 21
end

def total(cards)
  values = cards.map { |card| card[0] }

  sum = 0
  values.each do |value|
    sum += if value.start_with?("A")
             11
           elsif value.to_i == 0 # J, Q, K
             10
           else
             value.to_i
           end
  end

  # correct for Aces
  values.select { |value| value.start_with?("A") }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def declare_winner(total_player, total_dealer)
  if total_player > 21
    prompt("You busted, so the dealer wins!")
  elsif total_dealer > 21
    prompt("The dealer busted, so you win!")
  else
    champion = winner(total_player, total_dealer)
    if champion == "tie"
      puts "There has been a tie!"
    else
      puts "The winner is the #{champion} "
    end
  end
end

def winner(total_player, total_dealer)
  if total_dealer == total_player
    "tie"
  elsif total_player > total_dealer
    "player"
  else
    "dealer"
  end
end

def continue?
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

loop do
  clear
  prompt("Welcome to twenty-one game!")
  shuffled_deck = DECK.shuffle

  player_cards = []
  dealer_cards = []
  loop do
    deal_cards(shuffled_deck, player_cards, dealer_cards)

    player_turn(player_cards, dealer_cards, shuffled_deck)

    break if total(player_cards) > 21
    puts "Now is the dealer's turn"
    puts "---------------------------------"
    dealer_turn(dealer_cards, shuffled_deck)
    puts "The dealer has completed its turn"
    show_full_info(player_cards, dealer_cards)

    break
  end
  total_player = total(player_cards)
  total_dealer = total(dealer_cards)
  puts "==================================="
  declare_winner(total_player, total_dealer)
  puts "==================================="

  break if !continue?
end

puts "Thanks for playing!"
