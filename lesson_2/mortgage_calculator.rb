def prompt(message)
  puts("=> #{message}")
end

prompt("Welcome to this fantastic mortgage calculator!")

prompt("First, I need to know the total loan amount")
loan_amount = gets.chomp.to_f

prompt("Now, tell me the Annual Percentage Rate in %")
annual_percentage_rate = gets.chomp.to_f

prompt("Finally, I need to know the loan duration")
p "years"
years = gets.chomp.to_i
months = gets.chomp.to_i

prompt("Calculating...")
loan_duration_months = years * 12 + months
monthly_interest_rate = annual_percentage_rate / 1200
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

prompt(monthly_interest_rate.to_s)
prompt(loan_duration_months.to_s)
prompt(monthly_payment.to_s)




