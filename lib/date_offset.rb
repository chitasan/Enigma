require './lib/generator'

module DateOffset
  include Generator 
  
  def squared_date_last_four(date)
    date_squared = date.to_i ** 2
    date_squared.digits.reverse.last(4)
  end

  def date_offsets(date)
    last_four = squared_date_last_four(date)
    date_offsets_hash = {}
    offsets_hash_keys.each_with_index do |letter, index|
      date_offsets_hash[letter] = last_four[index].to_i
    end
    date_offsets_hash
  end
end 