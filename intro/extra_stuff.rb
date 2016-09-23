# exercise 1
words = ['laboratory', 'experiment', 'Pans Labyrinth',
          'elaborate', 'polar bear']
# => regardless of which 'side'
words.each {|word| puts word if word =~ /(lab)/}

# exercise 2
# => Nothing prints as the block is not invoked. Return value is a Proc obj

# exercise 3
# => Exception handling allows the program to continue executing even when errors
# => occur. The syntax allows handling of an Exception object or descendant.

# exercise 4
def execute &block
  block.call
end

execute { puts "Hello from in side the execute method!"}

# exercise 5
# => The '&' keyword syntax was missing from the method definition's parameter.
# => This should be placed in front of the parameter 'block': &block
