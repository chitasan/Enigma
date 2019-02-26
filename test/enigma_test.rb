require './test/test_helper'
require 'pry'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end 

  def test_it_can_encrypt_a_message
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end 

  def test_it_can_encrypt_a_message_with_uppercase_letters
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("Hello World!", "02715", "040895")
    assert_equal expected, enigma.encrypt("HellO WorlD!", "02715", "040895")
  end
end 