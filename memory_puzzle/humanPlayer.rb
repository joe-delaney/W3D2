class HumanPlayer
  def prompt
    p "provide a guess in the form of: 0 1"
  end

  def get_pos()
      temp = gets.chomp.split(" ")
  end
end