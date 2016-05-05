require 'pry'
require './secret_code.rb'
require './instructions.rb'

# REMOVE PUTS CODE
# how does the code run - need to be able to loop through 8 guesses without calling the method 8 times
# 3 issues plus separating classes, method communcation, instance variables (input), and general refactoring
# need to be able to exit anywhere - using it twice
# need to return all illegal letters at once - it returns one at a time
#need a timer
# need to finish the closing statement
# how to play again or quit from the match and inform method

class Mastermind
  attr_reader     :input,
                  :secret_code,
                  :start

  def initialize
    @input
    @guesses      = 0
    @start = Time.now
    @secret_code  = SecretCode.new.secret_code
                    puts @secret_code
  end

  CHAR_SET = ["w", "p", "g", "y", "r", "b"]

  def welcome
    puts "\nWelcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n"
    @input = gets.chomp.downcase
  end

  def getting_started
    input = @input
    valid = ["p", "i", "q"]
    ready_to_play = false
    until ready_to_play
      unless valid.include?(input)
        puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
        input = gets.chomp
      end
      case
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
    puts "\nI have generated a beginner sequence with 5 elements made up of:\n(r)ed, (g)reen, (b)lue, (y)ellow, (p)urple and (w)hite. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n"
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
        puts "\nHere's the secret code: #{secret_code.inspect}\n"
        exit
      when input.size < 5
        puts "That's not enough. Choose at exactly 5 valid colors:"
        input = gets.chomp.downcase.chars
      when input.size > 5
        puts "That's too many. Choose exactly 5 valid colors:"
        input = gets.chomp.downcase.chars
      when input.all? do |letter|
            if CHAR_SET.include?(letter) == false
            puts "Your guess '#{input.join.upcase}' contains invalid colors. Please choose five valid colors: "
        @input = gets.chomp.downcase.chars
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
      if input == secret_code
        @end = Time.now
        puts "\nCongratulations! You guessed the sequence '#{input.join.upcase}' in #{@guesses} guess(es) over #{timer.to_s} seconds.\n\nDo you want to (p)lay again or (q)uit?\n\n"
        final_choice = gets.chomp
        if final_choice == "p"
          mastermind = Mastermind.new
        elsif final_choice == "q"
          exit
        else
          puts "\n\nDo you want to (p)lay again or (q)uit?\n\n"
        end
      else
        matches = (input & secret_code).size
        correct_color_and_position = input.zip(secret_code)
        correct_color_and_position.each do |pair|
          if pair[0] == pair[1]
            perfect_matches += 1
          end
        end
        puts "\n'#{input.join.upcase}' has #{matches} of the correct elements with #{perfect_matches} in the correct position(s)."
          if @guesses < 8
            puts "\nYou've taken #{@guesses} guess(es).\n\n"
          elsif @guesses == 8
            @end = Time.now
            puts "\nThat's 8 guesses. GAME OVER!\n\n"
            exit
          end
        @input = gets.chomp.downcase.chars
      end
    end

    def timer
      (@end - @start).round
    end

end

class MainFunction

    mastermind = Mastermind.new
    mastermind.welcome
    mastermind.getting_started
    mastermind.code_generated_message
    loop do
    mastermind.guess
    mastermind.match_and_inform
    end
    mastermind.timer

end
