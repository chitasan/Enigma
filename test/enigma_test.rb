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

  def test_it_can_join_adjacent_pair
    enigma = Enigma.new
  
    expected = ["02", "27", "71", "15"]
    assert_equal expected, enigma.join_adjacent_pair("02715")
  end 

  def test_it_can_create_paired_num_offsets
    enigma = Enigma.new

     expected = {
      A: 02,
      B: 27,
      C: 71,
      D: 15
    }
    assert_equal expected, enigma.paired_number_offsets("02715")
  end 

  def test_it_return_last_four_digits_of_squared_date
    enigma = Enigma.new

    assert_equal [1,0, 2, 5], enigma.squared_date_last_four("040895")
  end 

  def test_it_can_create_date_offsets
    enigma = Enigma.new 

    expected = {
      A: 1,
      B: 0,
      C: 2,
      D: 5
    }
    assert_equal expected, enigma.date_offsets("040895")
  end 

  def test_it_can_create_shifts
    enigma = Enigma.new 

    expected = { 
      A: 3, 
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal expected, enigma.create_shifts("02715", "040895")
  end
end 