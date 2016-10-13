require 'yaml'
MESSAGES = YAML.load_file('msg_config.yml')

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
      prompt MESSAGES['num_fail']
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
      prompt MESSAGES['apr_fail']
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
      prompt MESSAGES['duration_fail']
    end
  end
end

def calc_monthly_interest_rate(apr)
  ((apr / 12) / 100)
end

def calc_duration_in_months(duration)
  duration * 12
end

def calc_monthly_payments(p, j, n)
  r = p * (j / (1 - (1 + j)**-n))
  r.round(2)
end

# MSG: welcome
prompt MESSAGES['welcome']

loop do
  # MSG: ask for loan amount
  prompt MESSAGES['loan_amount_prompt']
  loan_amount = fetch_loan_amount

  # MSG: ask for APR (annual percentage rate) denominated in 10s 10 = > 10%
  prompt MESSAGES['apr_prompt']
  apr = fetch_apr

  # MSG: ask loan duration
  prompt MESSAGES['loan_duration_prompt']
  loan_duration = fetch_duration

  # calc monthly interest rate
  monthly_interest_rate = calc_monthly_interest_rate(apr)
  # calc loan duration in months
  duration_in_months = calc_duration_in_months(loan_duration)

  # calc monthly payments
  monthly_payments = calc_monthly_payments(loan_amount,
                                           monthly_interest_rate,
                                           duration_in_months)
  # display data to user
  prompt(monthly_payments)

  # check if user wants another calculation
  prompt MESSAGES['replay']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt MESSAGES['goodbye']
