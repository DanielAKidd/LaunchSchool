require 'yaml'
MESSAGES = YAML.load_file('msg_config.yml')

# A command line calculator

def prompt(msg)
  puts("==> #{msg}")
end

def integer?(input)
  # cannot handle '00' case as 'to_i' method will return '0'
  # despite '00' being legitimate input
  # input.to_i.to_s == input

  # cannot handle decimal (float) input
  # input with leading zeros or what should be some fraction
  # will only record number first occurence of non-zero integer
  /^\d+$/.match(input)
end

def float?(input)
  # checks if digit present then if a single period (decimal point)
  # is present surrounded by only digits
  /\d/.match(input) && /^\d*\.?\d*$/.match(input)
end

def fetch_number
  num = ''
  loop do
    num = gets.chomp
    if integer?(num)
      return num.to_i
    elsif float?(num)
      return num.to_f
    end
    prompt MESSAGES['num_fail']
  end
end

def fetch_operation
  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      return operator
    else
      prompt MESSAGES['op_fail']
    end
  end
end

def operation_to_msg(op)
  msg = case op
        when '1'
          'Adding'
        when '2'
          'Subtracting'
        when '3'
          'Multiplying'
        when '4'
          'Dividing'
        end
  # by using the return value from case we have more control over this
  # method's return value
  msg
end

def display_op(op, num1, num2)
  "We are #{op} #{num1} by #{num2}"
end

def display_calc(result)
  "..And the answer is: #{result}"
end

def calc(n1, n2, op)
  result = case op
           when '1'
             n1 + n2
           when '2'
             n1 - n2
           when '3'
             n1 * n2
           when '4'
             n1 / n2
           end
  result
end

###

# welcome message
prompt MESSAGES['welcome']

loop do # main
  # get numbers from user
  prompt MESSAGES['num_prompt1']
  num1 = fetch_number
  prompt MESSAGES['num_prompt2']
  num2 = fetch_number

  # get math operation from user
  op_prompt = <<-MSG
  What operation would you like to perform:
  1) Addition
  2) Subtraction
  3) Multiplication
  4) Division
  MSG
  prompt op_prompt
  op = fetch_operation
  operation = operation_to_msg(op)

  # display operation
  prompt display_op(operation, num1, num2)

  # calculate result
  result = calc(num1, num2, op)
  # display calculation
  prompt display_calc(result)

  # check if user wants another calculation
  prompt MESSAGES['replay']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

# goodbye message
prompt MESSAGES['goodbye']
