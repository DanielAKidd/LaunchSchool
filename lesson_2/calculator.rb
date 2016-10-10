# A command line calculator

def prompt(msg)
  puts("==> #{msg}")
end

def integer?(input)
  # cannot handle '00' case as 'to_i' meth will return '0'
  # despite '00' being legitimate input
  # input.to_i.to_s == input

  # cannot handle decimal (float) input
  # input with leading zeros or what should be some fraction
  # will only record number first occurence of non-zero integer
  /^\d+$/.match(input)
end

def valid_number?
  num = ''
  loop do
    num = gets.chomp
    break if integer?(num)
    prompt('Oops.. please enter a valid number')
  end
  num.to_i
end

def calc(n1, n2, op)
  operation = ''
  result = case op
           when '1'
             operation = 'Adding'
             n1 + n2
           when '2'
             operation = 'Subtracting'
             n1 - n2
           when '3'
             operation = 'Multiplying'
             n1 * n2
           when '4'
             operation = 'Dividing'
             n1.to_f / n2.to_f # integers only otherwise
           end
  prompt "We are #{operation} #{n1} by #{n2}"
  prompt "..And the answer is: #{result}"
end

###

# intro message
prompt "Hi welcome\nProvide two numbers and a basic operation for a solution"

loop do # main
  # instructions
  prompt 'what is your first number?'
  num1 = valid_number?
  prompt 'what is your second number?'
  num2 = valid_number?

  operator_prompt = <<-MSG
  What operation would you like to perform:
  1) Addition
  2) Subtraction
  3) Multiplication
  4) Division
  MSG
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('must chose 1, 2, 3 or 4')
    end
  end

  # invoke our 'calc' method
  calc(num1, num2, operator)

  # check if user wnats another calculation
  prompt('Enter Y for another calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# goodbye message
prompt('Farewell')
