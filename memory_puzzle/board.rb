class Board
  def initialize(size = 4)
    @grid = Array.new(size) {Array.new(size, nil)} 
  end

  def populate
    pairs = size **2 /2
    symbols = ("A..Z").to_a
    i = 0
    possible_ind = []
    while i < @grid.length
      j = 0
      while j < @grid[i].length
        possible_ind << [i,j]
        j+=1
      end
      i+=1
    end
    i = 0
    while i < pairs
      current_ind = possible_ind.sample.pop()
      @grid[current_ind[0]][current_ind[1]] = Card.new(symbols[i])
      current_ind = possible_ind.sample.pop()
      @grid[current_ind[0]][current_ind[1]] = Card.new(symbols[i])
      i+=1
    end
  end

end