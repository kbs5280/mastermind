require 'pry'
require './secret_code.rb'
require './instructions.rb'

# need to be able to exit anywhere - using it twice
# need to return all illegal letters at once - it returns one at a time
# need to be able to loop through 8 guesses without calling the method 8 times
#need a timer
# need to finish the closing statement
#how to play again or quit from the match and inform method

class Mastermind

  def initialize
    @secret_code = SecretCode.new.secret_code
    puts @secret_code
    @input
    @guesses = 0
  end

  CHAR_SET = ["w", "p", "g", "y", "r", "b"]

  def welcome
    puts "\nWelcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n"
    @input = gets.chomp.downcase
  end

  def getting_started
    input = @input
    ready_to_play = false
    until
      ready_to_play
      case
      when (input != "p" && input != "q" && input != "i" && input != "c")
        puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
        input = gets.chomp
      when input == "q"
        puts "\nAw, man, YOU QUIT!\n\n"
        exit
      when input == "i"
        puts Instructions.new.instructions
        puts "\nEnter (p)lay when you are ready to play."
        input = gets.chomp.downcase
      when input == "p"
        ready_to_play = true
      end
    end
  end

  def code_generated_message
    puts "\nI have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n"
    @input = gets.chomp.downcase.chars
  end

  def guess
    input = @input
    guess_complete = false
    until guess_complete
      case
      when input == ["q"]
        puts "\nAw, man, YOU QUIT!\n\n"
        exit
      when input == ["c"]
        puts "\nHere's the secret code you cheater: #{@secret_code.inspect}\n"
        exit
      when input.size < 4
        puts "That's not enough. Choose at exactly 4 valid colors:"
        input = gets.chomp.downcase.chars
      when input.size > 4
        puts "That's too many. Choose exactly 4 valid colors:"
        input = gets.chomp.downcase.chars
      when input.each do |letter|
          if CHAR_SET.include?(letter) == false
            puts "\n'#{letter}' is not a valid color. Enter 4 valid colors:"
            input = gets.chomp.downcase.chars
      else
          guess_complete = true
          end
        end
      end
    end
  end

  def match_and_inform
    @guesses += 1
    input = @input
    perfect_matches = 0
      if input == @secret_code
        puts "\nCongratulations! You guessed the sequence '#{input.join.upcase}' in #{@guesses} guesses over 4 minutes,
        22 seconds.\n\nDo you want to (p)lay again or (q)uit?\n\n"
        exit
      else
        combined_letters = input & @secret_code
        matches = combined_letters.length - combined_letters.uniq.length
        correct_color_and_position = input.zip(@secret_code)
        correct_color_and_position.each do |pair|
          if pair[0] == pair[1]
            perfect_matches += 1
          end
        end
        puts "\n'#{input.join.upcase}' has #{matches + perfect_matches} of the correct elements with #{perfect_matches} in the correct position(s)."
          if @guesses < 8
            puts "\nYou've taken #{@guesses} guess(es).\n\n"
          elsif @guesses == 8
            puts "\nThat's 8 guesses. GAME OVER!\n\n"
            exit
          end
        @input = gets.chomp.downcase.chars
      end
    end
end

mastermind = Mastermind.new
mastermind.welcome
mastermind.getting_started
mastermind.code_generated_message
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
mastermind.guess
mastermind.match_and_inform
