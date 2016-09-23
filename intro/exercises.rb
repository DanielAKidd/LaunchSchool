arr = [1,2,3,4,5,6,7,8,9,10]

# Exercise 1
arr.each {|x| puts x}

# Exercise 2
arr.each {|x| puts x if x > 5}

# Exercise 3
new_arr = arr.select {|x| puts x if x % 2 != 0}

# Exercise 4
arr.insert(0, 0) # prepend
arr.insert(-1, 11) # append
# => also .push and << to append an object

# Exercise 5
arr.pop
arr.push 3

# Exercise 6
arr.uniq!

# Exercise 7
# => An Array is an ordered list of objects. A Hash has key:value pairs that is only
# => ordered by most recently added.

# Exercise 8
# => using symbols
# => h = {:fruit => "Apple"}
# => h = {fruit: "Apple"}

# Exercise 9
# => 1. h[:b]
# => 2. h[:e] = 5
# => 3. h.select! {|k,v| v > 3.5}
# => could also use  .delete_if  .reject

# exercise 10
h = {fruits: ['apple', 'orange']}
a = [ {number: 2, name: 'Bob'}]

# Exercise 11

# Exercise 12
# => contacts["Joe Smith"][:email] = contact_data[0][0]
# => etc

# Exercises 13
# => contacts["Joe Smith"][:email]
# => contacts["Sally Johnson"][:phone_number]

# Exercise 14
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hsh|
  fields.each do |field|
    hsh[field] = contact_data.shift
  end
end

# exercise 15
array = ['snow', 'fire', 'ice', 'winter', 'slippery']
array.delete_if do |word|
  word.start_with? 's' # word.start_with?('s', 'w')
end

# Exercise 16
# => a.map! {|str| str.split}.flatten

# Exercise 17
# => hashes are the same. these two definitions demonstrate syntax
# =>  of symbols in hashes


