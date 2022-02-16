class ComputerPlayer

  def initialize
    @known_positions = Hash.new {|h,k| h[k] = []}
    @available_positions = []
    @first_guess = true
    @revealed_card = nil
    @last_position = nil
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
        return_position = positions[0] if positions.length == 2
      end
    else
      if @known_positions.has_key?(@revealed_card.to_s)
        if @last_position != @known_positions[@revealed_card.to_s][0]
          return_position = @known_positions[@revealed_card.to_s][0]
        end
      end
    end

    if !@known_positions.has_value?(return_position)
      @available_positions.delete(return_position)
    end
    return_position
  end

  def receive_revealed_card(pos, card, guess)
    @known_positions[card.reveal] << [pos[0].to_s, pos[1].to_s]
    p @known_positions[card.reveal]
    @first_guess = guess
    if @first_guess
      @revealed_card = nil
      @last_position = nil
    else
      @revealed_card = card 
      @last_position = [pos[0].to_s, pos[1].to_s]
    end 
  end
end