require './lib/key_offset'

class Enigma
  include KeyOffset
  
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

  def create_shifts(key, date)
    date = date_offsets(date)
    key = paired_number_offsets(key)
    date.merge(key) do |letter, date, key|
      date + key
    end 
  end

  def split_message_into_groups_of_four_chars(message)
    grouped_by_four = []
    message.chars.each_slice(4) do |four_chars|
      grouped_by_four << four_chars
    end
    grouped_by_four
  end
  
  def shift_char(character, shift_value)
    if character_set.include?(character)
      index = character_set.find_index(character)
      shifted_char = character_set.rotate(shift_value)
      shifted_char[index]
    else
      character
    end 
  end

  def shift_four_chars(characters, shift_values)
    characters.map.with_index do |character, index|
      shift_char(character, shift_values[index])
    end 
  end
end 