require 'pry'
require './secret_code.rb'
require './instructions.rb'

# need to pipe in instructions
# need to be able to exit anywhere
# need to be able to cheat
# need to return all illegal letters at once
# need to skip counter when too short or long
# need to be able to loop through 8 guesses
# need to exit after 8 guesses
# need to return the closing statement
#need a timer

class Mastermind

  def initialize
    @secret_code = SecretCode.new.secret_code
    puts @secret_code
    @instructions = Instructions.new.instructions
    @input
    @guesses = 0
  end

  def welcome
    puts "\nWelcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n"
    @input = gets.chomp
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
        puts "\nYou're a quitter.\n"
        exit
      when input == "c"
        puts secret_code.inspect
        exit
      when input == "i"
        puts "Enter (p)play when you are ready to go."
        puts @instructions
        input = gets.chomp
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
    @guesses += 1
    if @guesses > 8
      puts "That is 8 guesses. You're a loser."
    else
      input = @input
      guess_complete = false
      until guess_complete
        case
        when input.size < 4
          puts "That's not enough. Choose at exactly 4 valid colors:"
          input = gets.chomp.downcase.chars
        when input.size > 4
          puts "That's too many. Choose exactly 4 valid colors:"
          input = gets.chomp.downcase.chars
        when input.each do |letter|
            if ["w", "p", "g", "y", "r", "b"].include?(letter) == false
              puts "\n'#{letter}' is not a valid color. Enter 4 valid colors:"
              input = gets.chomp.downcase.chars
            else
              guess_complete = true
            end
          end
        end
      end
      puts input.inspect
    end
  end

  def match_and_inform
    input = @input
    perfect_matches = 0
      if input == @secret_code
        puts "\nTHAT'S CORRECT! You win you dirty bastard!\n\n"
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
        puts "\nCorrect color, wrong position: #{matches}\n"
        puts "\nCorrect color, correct position: #{perfect_matches}\n"
        puts "\nThat was guess number #{@guesses} of 8. Guess again:\n\n"
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
