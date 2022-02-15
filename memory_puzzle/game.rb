require_relative "board.rb"
require_relative "card.rb"

class Game
  def initialize(size=4)
    @board = Board.new(size)
    @board.populate
    @previous_guess = nil
  end

  def valid?(guess)
    if guess.length != 2
      return false
    end
    if guess[0].to_i.to_s != guess[0] ||  guess[1].to_i.to_s != guess[1] 
      return false
    end
    if (guess[0].to_i < 0 && guess[0].to_i >= @board.size) || (guess[1].to_i < 0 && guess[1].to_i >= @board.size)
      return false
    end
    return true
  end
  def play()
    while !@board.won?
      @board.render
      p "provide a guess in the form of: 0 1"
      temp = gets.chomp.split(" ")
      if !valid?(temp)
        self.play()
      end
    end
  end
end
game = Game.new()
game.play()