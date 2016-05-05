class Bastard
  attr_reader   :name

  def initialize
    @name = name
  end

  def whats_my_name
    puts "whats yer name"
    name = gets.chomp
  end

  def say_it
    puts "my name is #{name}"
  end

end


bastard = Bastard.new
bastard.whats_my_name
bastard.say_it
