require_relative "board.rb"
require_relative "card.rb"
require_relative "humanPlayer.rb"
require_relative "computerPlayer.rb"

class Game
  def initialize(size=4, player)
    @board = Board.new(size)
    @board.populate
    @previous_guess = nil
    @player = player
    @player.set_up(@board.size)
  end

  def valid?(guess)
    # if guess.length != 2
    #   return false
    # end
    # if guess[0].to_i.to_s != guess[0] ||  guess[1].to_i.to_s != guess[1] 
    #   return false
    # end
    # if (guess[0].to_i < 0 || guess[0].to_i >= @board.size) || (guess[1].to_i < 0 || guess[1].to_i >= @board.size)
    #   return false
    # end
    # if @board[[guess[0].to_i,guess[1].to_i]].face_up 
    #   return false
    # end
    return true
  end

  def play()
    while !@board.won?
      system('clear')
      @board.render
      @player.prompt
      pos = @player.get_pos
      while !valid?(pos)
        p "Invalid guess. Guess in the form of: 0 1"
        pos = @player.get_pos
      end
      #make_guess([pos[0].to_i, pos[1].to_i])
      make_guess([pos[0].to_i, pos[1].to_i])
    end
    system("clear")
    @board.render
    p "YOU WON!"
  end

  def make_guess(pos)
    if @previous_guess.nil?
      @previous_guess = @board[pos]
      @board.reveal(pos)
      @player.receive_revealed_card(pos, @board[pos], false)
    else
      if !(@previous_guess == @board.reveal(pos))
        system('clear')
        @board.render
        p "Try Again."
        sleep(1.5)
        system('clear')
        @player.receive_revealed_card(pos, @board[pos], true)
        @previous_guess.hide
        @board[pos].hide
      end
      @previous_guess = nil
    end
  end
end

game = Game.new(ComputerPlayer.new)
game.play()