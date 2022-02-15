require_relative 'card.rb'

class Board
  def initialize(size=4)
    @grid = Array.new(size) {Array.new(size, nil)} 
  end

  def size
    @grid.length
  end

  def populate
    pairs = @grid.length**2 /2 
    symbols = ("A".."Z").to_a
    
    #Find all possible indices in grid
    possible_ind = []
    i = 0
    while i < @grid.length
      j = 0
      while j < @grid[i].length
        possible_ind << [i,j]
        j+=1
      end
      i+=1
    end
    #Populate all indices with face values randomly using sample
    i = 0
    while i < pairs
      current_ind = possible_ind.sample
      possible_ind.delete(current_ind)
      @grid[current_ind[0]][current_ind[1]] = Card.new(symbols[i])
      current_ind = possible_ind.sample
      possible_ind.delete(current_ind)
      @grid[current_ind[0]][current_ind[1]] = Card.new(symbols[i])
      i+=1
    end
  end

  def render
    new_grid = Array.new(@grid.length) {Array.new(@grid.length, nil)}
    print "Current State: \n"
    column_header = " "
    (0...@grid.length).each do |i|
      column_header += "    #{i}"
    end
    print "#{column_header}\n"

    (0...@grid.length).each do |row|
      new_str = ""
      (0...@grid[row].length).each do |col|
        new_str += "  #{@grid[row][col].to_s}  "
      end
      print "#{row}  #{new_str}\n"
    end
  end

  def won?
    @grid.each { |row| return false if row.any?{|card| !card.face_up}}
    return true
  end

  def reveal(guess_pos)
    row = guess_pos[0]
    col = guess_pos[1]
    return @grid[row][col].reveal 
  end

end

# board = Board.new 
# board.populate
# board.render
# p board.reveal([0,1])
# board.render
