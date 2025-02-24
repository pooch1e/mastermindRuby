#Mastermind

# make a 4-digit random number between 0000 and 9999
# in a loop:
#     ask for a guess
#     finish if the guess is completely right
#     count how many digits are correct and in the right place
#     count how many digits are correct but in the wrong place
#     print the counts


#gen random number to guess
code = rand(0..9999)
#split to array so easy to iterate over
code_array = []
code_array = code.to_s.split("")

puts code_array