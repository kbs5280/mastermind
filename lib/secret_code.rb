require 'pry'

class SecretCode
  attr_reader :secret_code

  def initialize
    @secret_code = 5.times.map { ["w", "p", "g", "y", "r", "b"].sample }
  end

end
