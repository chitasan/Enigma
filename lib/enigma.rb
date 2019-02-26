class Enigma
  def character_set #to Generator
    character_set = ("a".."z").to_a << " " 
  end
  
  def generate_key #to Generator
    (0..9).to_a.sample(5).join("")
  end 
  
  def generate_date #to Generator
    Date.today.strftime('%m%d%y')
  end

  def shift_keys #to Generator 
    ("A".."D").to_a
  end

  def offsets_hash_keys #to Generator 
    shift_keys.map do |letter|
      letter.to_sym
    end 
  end 

  def split_and_pair_key(key)
    split_num = key.split(//)
    split_num_to_i = split_num.map do |num|
      num.to_i
    end 
    split_num_to_i.each_cons(2).to_a
  end

  def join_adjacent_pair(key)
    split_and_pair_key(key).map do |pair|
      pair.join
    end 
  end

  def paired_number_offsets(key)
    paired = join_adjacent_pair(key)
    paired_num_offsets_hash = {}
    offsets_hash_keys.each_with_index do |letter, index|
      paired_num_offsets_hash[letter] = paired[index].to_i
    end
    paired_num_offsets_hash
  end 

  def squared_date_last_four(date)
    date_squared = date.to_i ** 2
    date_squared.digits.reverse.last(4)
  end
end 