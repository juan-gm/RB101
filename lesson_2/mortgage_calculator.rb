def prompt(message)
  puts("=> #{message}")
end

def valid?(input)
  ((input.to_f.to_s == input) ||
    (input.to_i.to_s == input)) &&
    (input.to_f > 0.0)
end

loop do
  prompt("Welcome to this fantastic mortgage calculator!")

  loan_amount = ''
  annual_percentage_rate = ''
  years = ''
  months = ''

  loop do
    prompt("First, I need to know the total loan amount")
    loan_amount = gets.chomp
    break if (!loan_amount.empty?) && (valid?(loan_amount))
    prompt("Please, introduce a non-zero positive number")
  end

  loop do
    prompt("Now, tell me the Annual Percentage Rate in %")
    annual_percentage_rate = gets.chomp
    break if (!annual_percentage_rate.empty?) &&
             (valid?(annual_percentage_rate))
    prompt("Please, introduce a non-zero positive number")
  end

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

  prompt("Calculating...")
  loan_duration_months = years.to_i * 12 + months.to_i
  monthly_interest_rate = annual_percentage_rate.to_f / 1200
  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate / (1 -
                    (1 + monthly_interest_rate)**(-loan_duration_months)))

  monthly_interest_rate *= 100
  prompt("The monthly interest rate is:
        #{format('%.2f', monthly_interest_rate)}%")
  prompt("The loan duration is: #{loan_duration_months} months")
  prompt("The monthly payments are: #{format('%.2f', monthly_payment)} €")

  prompt("Do you want to perform another calculation?
    Press Y to calculate again")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Good bye!")
