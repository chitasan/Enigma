require './lib/key_offset'
require './lib/date_offset'

class Enigma
  include KeyOffset
  include DateOffset  

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