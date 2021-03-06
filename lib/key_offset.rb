require './lib/generator'

module KeyOffset
  include Generator 

  def offsets_hash_keys  
    shift_keys.map { |letter| letter.to_sym } 
  end 

  def split_and_pair_key(key)
    split_num = key.split(//)
    split_num_to_i = split_num.map { |num| num.to_i }
    split_num_to_i.each_cons(2).to_a
  end

  def join_adjacent_pair(key)
    split_and_pair_key(key).map { |pair| pair.join }
  end

  def paired_number_offsets(key)
    paired = join_adjacent_pair(key)
    paired_num_offsets_hash = {}
    offsets_hash_keys.each_with_index do |letter, index|
      paired_num_offsets_hash[letter] = paired[index].to_i
    end
    paired_num_offsets_hash
  end 
end 