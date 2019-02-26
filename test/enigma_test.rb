require './test/test_helper'
require 'pry'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end 

  def test_it_has_a_character_set_of_27
    enigma = Enigma.new
   
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.character_set
    assert_equal 27, enigma.character_set.count
  end

  def test_it_can_generate_key
    enigma = Enigma.new

    assert_equal 5, enigma.generate_key.length
    assert_equal String, enigma.generate_key.class
  end 

  def test_it_can_generate_date
    enigma = Enigma.new

    assert_equal 6, enigma.generate_date.length
    assert_equal String, enigma.generate_date.class
  end

  def shift_keys #to Generator 
    ("A".."D").to_a
  end

  def test_it_return_hash_with_keys_symbol 
    enigma = Enigma.new

    expected = [:A, :B, :C, :D]
    assert_equal expected, enigma.offsets_hash_keys
  end

  def test_it_can_split_and_pair_key
    enigma = Enigma.new 

    expected = [
      [0, 2],
      [2, 7],
      [7, 1],
      [1, 5]
    ]
    assert_equal expected, enigma.split_and_pair_key("02715")
  end
end 