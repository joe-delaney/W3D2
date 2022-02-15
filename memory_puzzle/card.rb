class Card

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def face_up
    return @face_up
  end

  def to_s
    if @face_up 
      @face_value
    else
      " "
    end
  end
  
  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    @face_value
  end

  def ==(card)
    self.to_s == card.to_s
  end

end