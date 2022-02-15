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

    if @first_guess
      @known_positions.each do |face_value, positions|
        return_position = positions if positions.length == 2
      end
    else
      if @known_positions.has_key?(@revealed_card.to_s)
        return_position = @known_positions[@revealed_card.to_s]
      end
    end

    if !@known_positions.has_value?(return_position)
      @available_positions.delete(return_position)
    end
    return_position
  end

  def receive_revealed_card(pos, card, guess)
    @known_positions[card.to_s] << pos
    @first_guess = guess
    if @first_guess
      @revealed_card = nil
    else
      @revealed_card = card 
    end 
  end
  

end