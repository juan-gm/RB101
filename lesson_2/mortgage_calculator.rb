def prompt(message)
  puts("=> #{message}")
end

def valid?(input)
  ((input.to_f.to_s == input) ||
    (input.to_i.to_s == input)) &&
    (input.to_f > 0.0)
end

def retrieve_loan_amount
  loan_amount = ''
  loop do
    prompt("First, I need to know the total loan amount")
    loan_amount = gets.chomp
    break if (!loan_amount.empty?) && (valid?(loan_amount))
    prompt("Please, introduce a non-zero positive number")
  end
  loan_amount
end

def retrieve_apr_amount
  apr = ''
  loop do
    prompt("Now, tell me the Annual Percentage Rate in %")
    apr = gets.chomp
    break if (!apr.empty?) &&
             (valid?(apr))
    prompt("Please, introduce a non-zero positive number")
  end
  apr
end

def retrieve_duration
  years = ''
  months = ''
  prompt("Finally, I need to know the loan duration")
  loop do
    loop do
      prompt("Years: ")
      years = gets.chomp
      break if years.to_i.to_s == years
      prompt("Please, enter a number as years")
    end
    loop do
      prompt("Months: ")
      months = gets.chomp
      break if months.to_i.to_s == months
      prompt("Please, enter a number as months")
    end
    break if years.to_i + months.to_i != 0
    prompt("Remember that years AND months can't be zero!")
  end
  years.to_i * 12 + months.to_i
end

def calculate_monthly_rate(apr)
  prompt("Calculating...")
  apr.to_f / 1200
end

def calculate_monthly_payment(loan_amount, monthly_interest_rate, monthly_duration)
  loan_amount.to_f *
  (monthly_interest_rate / (1 -
  (1 + monthly_interest_rate)**(-monthly_duration)))
end

def display_full_calculation(monthly_interest_rate, monthly_duration, monthly_payment)
  prompt("The monthly interest rate is:
        #{format('%.2f', monthly_interest_rate*100)}%")
  prompt("The loan duration is: #{monthly_duration} months")
  prompt("The monthly payments are: #{format('%.2f', monthly_payment)} €")
end

loop do
  system("clear")
  prompt("Welcome to this fantastic mortgage calculator!")

  loan_amount = retrieve_loan_amount
  apr = retrieve_apr_amount
  monthly_duration = retrieve_duration
  
  
  monthly_interest_rate = calculate_monthly_rate(apr)
  monthly_payment = calculate_monthly_payment(loan_amount, monthly_interest_rate, monthly_duration)
  
  display_full_calculation(monthly_interest_rate, monthly_duration, monthly_payment)
  
  prompt("Do you want to perform another calculation?
    Press Y to calculate again")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
system("clear")