require_relative 'card.rb'
require_relative 'board.rb'
require_relative 'game.rb'

class ComputerPlayer

  def initialize
    @known_positions = Hash.new {|h,k| h[k] = []}
    @available_positions = []
    @first_guess = true
    @revealed_card = nil
  end

  def set_up(size)
    (0...size).each do |row|
      (0...size).each do |col|
        @available_positions << [row.to_s, col.to_s]
      end
    end
  end

  def prompt
    p "provide a guess in the form of: 0 1"
  end

  def get_pos
    return_position = @available_positions.sample
    if first_guess
      known_positions.each do |face_value, positions|
        return_position = positions[0] if positions.length == 2
      end
    else
      if @known_positions.has_key?[@revealed_card.to_s]
        return_position = @known_positions[@revealed_card.to_s]
      end
    end
    return_position
  end

  def receive_revealed_card(pos, card)
    @known_positions[card.to_s] << pos
    @revealed_card = card
    first_guess = !first_guess
  end

end