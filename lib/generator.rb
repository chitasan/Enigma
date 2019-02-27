module Generator 
  def character_set
    ("a".."z").to_a << " " 
  end
  
  def generate_key
    (0..9).to_a.sample(5).join("")
  end 
  
  def generate_date
    Date.today.strftime('%m%d%y')
  end

  def shift_keys
    ("A".."D").to_a
  end
end 