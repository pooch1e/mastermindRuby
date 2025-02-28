# frozen_string_literal: true

# Mastermind

# make a 4-digit random number between 0000 and 9999
# in a loop:
#     ask for a guess
#     finish if the guess is completely right
#     count how many digits are correct and in the right place
#     count how many digits are correct but in the wrong place
#     print the counts

# refractor into class
# split into game/player
class Game
  def initialize
    @game_won = false
    @answer = nil
    @turn = 0
    @game_end = 12 # final guess
    gen_answer
  end

  def gen_answer
    # gen random number to guess
    @answer = rand(0..9999).to_s.rjust(4, '0')
    # ensure number is 4 digits

    # split to array so easy to iterate over
    @answer_array = @answer.split('')

    print @answer_array # answer for debug
  end

  # compare guess to answer
  def compare_guess_to_answer(guess)
    puts @turn
    if guess == @answer_array
      puts 'correct'
      @game_won = true
      guess
    else
      answer_wrong(guess)
    end
  end

  def answer_wrong(guess)
    puts 'false'
    # iterate through guess + compare to answer
    # plus count everytime number is different

    wrong_count = guess.tally do |item, count|
      puts "You have #{count} of this #{item}"
    end


    correct_place = 0
    correct_digit_wrong_place = 0

    guess.each_with_index do |digit, index|
      if digit == @answer_array[index]
      correct_place += 1
      elsif @answer_array.include?(digit)
      correct_digit_wrong_place += 1
      end
    end

    puts "⚪️" # correct digits
    puts "⚫️" # wrong digits
    @game_won = false
    @turn += 1
    puts "Turn #{@turn}"
    @game_won = true if @turn == @game_end # if it is the 12th turn, end the game
    puts "Bad luck, try again"
  end

  class Player
    def initialize
      puts 'Enter your name'
      name = gets.chomp
      puts "Welcome #{name}!"
    end

    # ask for guess
    def ask_for_guess
      puts 'What is your guess?'
      guess = gets.chomp
      guess_arr = guess.to_s.split('')
      # ensure guess is only 4 digits
      while guess_arr.length != 4
        puts 'guess again'
        guess = gets.chomp
        guess_arr = guess.to_s.split('')
      end
      guess_arr
    end
  

    # end class
  end

  my_game = Game.new
  my_player = Player.new

  # make a guess
  # loop?
  until my_game.instance_variable_get(:@game_won)
    guess = my_player.ask_for_guess
    my_game.compare_guess_to_answer(guess)
  end
end
