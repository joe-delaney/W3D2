class ComputerPlayer

  def initialize
    @known_positions = {}
    @available_positions = []
  end

  def prompt
    p "provide a guess in the form of: 0 1"
  end

  def get_pos

  end

  def get_available_positions(board)
    @available_indices = []
    i = 0
    while i < board.size
      j = 0
      while j < board.size
        @available_indices << [i,j] if !board[[i, j]].face_up
        j+=1
      end
      i+=1
    end
  end

end