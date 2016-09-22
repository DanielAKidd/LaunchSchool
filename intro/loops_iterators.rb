# exercise 1
# This returns the caller, an Array

# exercise 2
def test
  loop do
    puts "Type something to be displayed. Type STOP to stop or use ctrl+c."
    input = gets.chomp
    break if input == "STOP"
    puts "You typed in: #{input}"
  end
end

#test

# exercise 3
a = ['a', 'b', 'c']
puts "Exercise 3:"
a.each_with_index {|item, index| puts "Item: #{item}, Index: #{index}"}

# exercise 4
def rec_test number
  puts number
  rec_test(number - 1) if number > 0
end

#rec_test 7

