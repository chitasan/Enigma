require './lib/shifts'

class Enigma
  include Shifts 

  def split_message_into_groups_of_four_chars(message)
    grouped_by_four = []
    message.chars.each_slice(4) do |four_chars|
      grouped_by_four << four_chars
    end
    grouped_by_four
  end
  
end 