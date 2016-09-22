# exercise 1
arr = [1, 3, 5, 7, 9, 11]
number = 3
puts "#{number} is in the array" if arr.include? number

# exercise 2
# 1. return: 1
#    arr = [["b"], ["b", 2]...
# 2. return: [1, 2, 3]
#    arr = [["b"], ["a", [1, 2, 3]]..]

# exercise 3
# p arr[1][0]
# p arr.last.first

# exercise 4
# 1. 6
# 2. error (NoMethodError)
# 3. 8

# exercise 5
# a: 'e'
# b: 'A'
# c: nil

# exercise 6
=begin
  the array expected an integer when being indexed.
  should use integer 3 instead
=end

# exercise 7
arr = [1, 2, 3, 4, 5]
new_arr = arr.map { |e| e + 2 }
