class Enigma
  def character_set #to Generator
    character_set = ("a".."z").to_a << " " 
  end
  
  def generate_key #to Generator
    (0..9).to_a.sample(5).join("")
  end 

  
end 