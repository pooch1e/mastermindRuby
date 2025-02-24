#Mastermind

# make a 4-digit random number between 0000 and 9999
# in a loop:
#     ask for a guess
#     finish if the guess is completely right
#     count how many digits are correct and in the right place
#     count how many digits are correct but in the wrong place
#     print the counts


#gen random number to guess
answer = rand(0..9999)
#split to array so easy to iterate over
answer_array = []
answer_array = answer.to_s.split("")

print answer_array #answer for debug


#ask for guess
def ask_for_guess()
  puts "What is your guess?"
  guess = gets.chomp
  guess_arr = guess.to_s.split("")
  #ensure guess is only 4 digits
  while guess_arr.length != 4
    puts "guess again"
    guess = gets.chomp
    guess_arr = guess.to_s.split("")
  end
  return guess_arr
end

#compare guess to answer
def compare_guess_to_answer(guesses_arr, answer_array) 
  if guesses_arr == answer_array
    puts "correct"
    return true
  else
    puts "false"
    return false
  end
end





#make a guess

