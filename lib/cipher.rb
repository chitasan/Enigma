require './lib/shifts'

class Cipher
  include Shifts 

  attr_reader :message, :key, :date

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date 
  end

  def split_message_into_groups_of_four_chars(message)
    grouped_by_four = []
    message.chars.each_slice(4) do |four_chars|
      grouped_by_four << four_chars
    end
    grouped_by_four
  end
end 
