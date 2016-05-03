require 'pry'
class Mastermind

  def initialize
    puts "\nWelcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n"
    @input = gets.chomp
    @guesses = 0
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
        puts "Enter (p)play when you are ready to go. (instructions)"
        input = gets.chomp
      when input == "p"
        ready_to_play = true
      end
    end
  end

  def secret_code
    4.times.map { ["w", "p", "g", "y", "r", "b"].sample }
  end

  def code_generated_message
    puts "\nI have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nWhat's your guess?\n"
    @input = gets.chomp.downcase.chars
    binding.pry
  end

  def guess
    @guesses += 1
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

  def match_and_inform
    input = @input
    perfect_matches = 0
    binding.pry
      if input == secret_code
        "You win you dirty bastard!"
        exit
      else
        combined_letters = input & secret_code
        matches = combined_letters.length - combined_letters.uniq.length
        correct_color_and_position = input.zip(secret_code)
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
mastermind.getting_started
code = mastermind.secret_code
puts "This is the secret code: #{code}"
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
