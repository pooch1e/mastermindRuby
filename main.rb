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
      puts 'false'
      # iterate through guess + compare to answer
      # plus count everytime number is different
      count = 0
      guess.each_with_index do |value, index|
        count += 1 if value == @answer_array[index]
        puts count
        @game_won = false
        @turn += 1
      end
    end
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
