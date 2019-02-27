require './lib/shifts'

class Cipher
  include Shifts 

  attr_reader :message, :key, :date  

  def initialize(message, key, date)
    @message = message.downcase
    @date = date
    @key = key 
  end 

  def self.encrypt(message, key, date)
    self.new(message, key, date).encrypt
  end 
  
  def self.decrypt(encrypted_message, key, date)
    self.new(encrypted_message, key, date).decrypt
  end 

  def encrypt
    splitted_message = split_message_into_groups_of_four_chars
    splitted_message.map do |four_chars|
      shift_four_chars(four_chars, shifts)
    end.join
  end 

  def decrypt
    splitted_message = split_message_into_groups_of_four_chars
    splitted_message.map do |four_chars|
      shift_four_chars(four_chars, negative_shifts)
    end.join
  end
      
  def split_message_into_groups_of_four_chars
    grouped_by_four = []
    @message.chars.each_slice(4) do |four_chars|
      grouped_by_four << four_chars
    end
    grouped_by_four
  end

  def shifts
    shifts_values(@key, @date)
  end 

  def negative_shifts
    negative_shifts_values(@key, @date)
  end 
end 