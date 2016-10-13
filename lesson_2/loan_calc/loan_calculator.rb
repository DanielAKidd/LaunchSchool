def prompt(msg)
  puts("==> #{msg}")
end

def integer?(input)
  /^\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def fetch_loan_amount
  num = ''
  loop do
    num = gets.chomp
    if float?(num)
      return num.to_f
    else
      #prompt MESSAGES['num_fail']
    end
  end
end

def fetch_apr
  num = ''
  loop do
    num = gets.chomp
    if float?(num)
      return num.to_f
    else
      # fail msg
    end
  end
end

def fetch_duration
  num = ''
  loop do
    num = gets.chomp
    if integer?(num)
      return num.to_i
    else
      # fail msg
    end
  end
end

def calc_monthly_interest_rate(apr)
  apr/12.0
end

def calc_duration_in_months(duration)
  duration*12
end

def calc_monthly_payments(p, j, n)
  p * (j / (1 - (1 + j)**-n))
end

def display
end

# MSG: welcome

loop do
  # MSG: ask for loan amount
  loan_amount = fetch_loan_amount

  # MSG: ask for APR (annual percentage rate) denominated in 10s 10 = > 10%
  apr = fetch_apr

  # MSG: ask loan duration
  loan_duration = fetch_duration

  # calc monthly interest rate
  monthly_interest_rate = calc_monthly_interest_rate
  # calc loan duration in months
  duration_in_months = calc_duration_in_months

  # calc monthly payments
  monthly_payments = calc_monthly_payments(loan_amount, 
                                           monthly_interest,
                                           duration_in_months)

  # display data to user

  # check if user wants another calculation
  #prompt MESSAGES['replay']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# MSG: farewell