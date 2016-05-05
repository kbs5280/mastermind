class GettingStarted
  attr_reader :input

  def welcome
    puts "\nWelcome to MASTERMIND\n\n1stWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n\n"
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
        input = gets.chomp.downcase
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
end
