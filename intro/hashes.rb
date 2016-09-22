# exercise 1
#new_arr = family.select do |key, value|
 # [:sisters, :brothers].include? key
#end

#arr = new_arr.values.flatten

# exercise 2
a = {colour: "Orange", number: 8, name: "Dan"}
b = {language: "Latin", colour: "Red"}

new_hash = a.merge b do |key, oldval, newvalue|
  oldval if oldval == "Orange"
end
# => need to capture return value with val

a.merge! b do |key, oldval, newvalue|
end

# => a is mutated. As no block was given the default behaviour is applied.
# => The value of "Red" overrides "Orange" prompted by a matching key

# exercise 3
h = {name: "Bob", occupation: "Uncle"}

puts h.keys
puts h.values
h.each {|k,v| puts "Key: #{k}, Value: #{v}"}

# exercise 4
# => person[:name]

# exercise 5
# => h.value? "Bob"

# exercise 6
result = {}
words.each do |word|
  k = word.chars.sort.join 
  if result.key? k 
    result[k] << word
  else
    result[k] = [word]
  end
end

# exercise 7
# => one used a symbol for key whilst other used a string

# exercise 8
# =>  b