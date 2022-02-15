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
    if (guess[0].to_i < 0 || guess[0].to_i >= @board.size) || (guess[1].to_i < 0 || guess[1].to_i >= @board.size)
      return false
    end
    return true
  end

  def play()
    while !@board.won?
      system('clear')
      @board.render
      p "provide a guess in the form of: 0 1"
      temp = gets.chomp.split(" ")
      while !valid?(temp)
        p "Invalid guess. Guess in the form of: 0 1"
        temp = gets.chomp.split(" ")
      end
      make_guess([temp[0].to_i, temp[1].to_i])
    end
    system("clear")
    @board.render
    p "YOU WON!"
  end

  def make_guess(pos)
    if @previous_guess.nil?
      @previous_guess = @board[pos]
      @board.reveal(pos)
    else
      if !(@previous_guess == @board.reveal(pos))
        system('clear')
        @board.render
        p "Try Again."
        sleep(1.5)
        system('clear')
        @previous_guess.hide
        @board[pos].hide
      end
      @previous_guess = nil
    end
  end
end
game = Game.new(2)
game.play()