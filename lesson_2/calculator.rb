# A command line calculator
def calc(n1, n2, op)
  result = if op == 1
             n1 + n2
           elsif op == 2
             n1 - n2
           elsif op == 3
             n1 * n2
           else
             n1.to_f / n2.to_f # integers only otherwise
           end
  puts "..And the answer is: #{result}"
end

# intro message
puts "Hi welcome\nProvide two numbers and a basic operation for a solution"

# instructions
puts 'what is your first number?'
num1 = gets.chomp.to_i
puts 'what is your second number?'
num2 = gets.chomp.to_i

puts 'What operation would you like to perform? Type a number to choose'
puts "1. addition\n2. subtraction\n3. multiplication\n4. division"
op = gets.chomp.to_i

# invoke our 'calc' method
calc num1, num2, op
