require './test/test_helper'

class CipherTest < Minitest::Test
  def test_it_exists 
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_instance_of Cipher, cipher
  end 

  def test_it_can_encrypt_message_from_self
    cipher = Cipher.encrypt("hello world!", "02715", "040895")

    assert_equal "keder ohulw!", cipher
  end

  def test_it_can_decrypt_message_from_self
    cipher = Cipher.decrypt("keder ohulw!", "02715", "040895")

    assert_equal "hello world!", cipher
  end

  def test_it_can_encrypt_a_message
    cipher = Cipher.new("hello world!", "02715", "040895")
    assert_equal "keder ohulw!", cipher.encrypt
  end 

  def test_it_can_decrypt_a_message
    cipher = Cipher.new("keder ohulw!", "02715", "040895")
    assert_equal "hello world!", cipher.decrypt
  end

  def test_it_can_return_shifts
   cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [3, 27, 73, 20], cipher.shifts
  end 

  def test_it_can_return_shifts_values
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [3, 27, 73, 20], cipher.shifts_values("02715", "040895")
  end 

  def test_it_can_return_negative_shifts
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [-3, -27, -73, -20], cipher.negative_shifts
  end

  def test_it_has_a_character_set_of_27
    cipher = Cipher.new("hello world!", "02715", "040895")
   
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, cipher.character_set
    assert_equal 27, cipher.character_set.count
  end

  def test_it_can_generate_key
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal 5, cipher.generate_key.length
    assert_equal String, cipher.generate_key.class
  end 

  def test_it_can_generate_date
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal 6, cipher.generate_date.length
    assert_equal String, cipher.generate_date.class
  end

  def test_it_return_hash_with_keys_symbol 
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = [:A, :B, :C, :D]
    assert_equal expected, cipher.offsets_hash_keys
  end

  def test_it_can_split_and_pair_key
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = [
      [0, 2],
      [2, 7],
      [7, 1],
      [1, 5]
    ]
    assert_equal expected, cipher.split_and_pair_key("02715")
  end

  def test_it_can_join_adjacent_pair
    cipher = Cipher.new("hello world!", "02715", "040895")
  
    expected = ["02", "27", "71", "15"]
    assert_equal expected, cipher.join_adjacent_pair("02715")
  end 

  def test_it_can_create_paired_num_offsets
    cipher = Cipher.new("hello world!", "02715", "040895")

     expected = {
      A: 02,
      B: 27,
      C: 71,
      D: 15
    }
    assert_equal expected, cipher.paired_number_offsets("02715")
  end 

  def test_it_return_last_four_digits_of_squared_date
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [1,0, 2, 5], cipher.squared_date_last_four("040895")
  end 

  def test_it_can_create_date_offsets
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = {
      A: 1,
      B: 0,
      C: 2,
      D: 5
    }
    assert_equal expected, cipher.date_offsets("040895")
  end 

  def test_it_can_create_shifts
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = { 
      A: 3, 
      B: 27,
      C: 73,
      D: 20
    }
    assert_equal expected, cipher.create_shifts("02715", "040895")
  end

  def test_it_can_return_negative_shifts_values
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [-3, -27, -73, -20], cipher.negative_shifts_values("02715", "040895")
  end 

  def test_it_can_shift_characters
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal "f", cipher.shift_char("c", 3)
    assert_equal "c", cipher.shift_char("y", 5)
    assert_equal "i", cipher.shift_char("p", 20)
    assert_equal "!", cipher.shift_char("!", 3)
    assert_equal "1", cipher.shift_char("1", 3)
    assert_equal "e", cipher.shift_char(" ", 5)
  end

  def test_it_can_shift_four_characters
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = [' ', '!', 'd', 'j']
    actual = cipher.shift_four_chars(['z', '!', 'a', 'f'], [1, 2, 3, 4])
    assert_equal expected, actual
  end 
end