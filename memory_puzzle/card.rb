class Card

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def to_s
    if @face_up 
      @face_value 
    end
  end
  
  def hide
    @face_up = false
  end

  def reveal
    @face_value
  end

  def ==(card)
    self.to_s == card.to_s
  end

end