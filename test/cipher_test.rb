require './test/test_helper'
require 'pry'

class CipherTest < Minitest::Test
  def test_it_exists 
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_instance_of Cipher, cipher
  end 

  def test_it_has_message
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_equal "hello world", cipher.message
  end 

  def test_it_has_key
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_equal "02715", cipher.key
  end

  def test_it_has_date
    cipher = Cipher.new("hello world", "02715", "040895")
  end 

  def test_it_can_encrypt_message_from_self
    skip
    cipher = Cipher.encrypt("hello world!", "02715", "040895")

    assert_equal 'keder ohulw!', cipher
  end

  def test_it_can_encrypt_a_message
    skip
    cipher = Cipher.new("hello world!", "02715", "040895")
    assert_equal 'keder ohulw!', cipher.encrypt
  end 

  def test_it_can_decrypt_a_message
    skip
    cipher = Cipher.new("keder ohulw!", "02715", "040895")
    assert_equal 'hello world!', cipher.decrypt
  end

  def test_it_can_return_shifts_values
  skip
   cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [3, 27, 73, 20], cipher.shifts
  end 

  def test_it_can_return_negative_shift
    skip
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [-3, -27, -73, -20], cipher.negative_shifts
  end 

  def test_it_split_and_join_message_into_groups_of_four_chars
    cipher = Cipher.new("hello world!", "02715", "040895")

    expected = [["h", "e", "l", "l"], ["o", " ", "w", "o"], ["r", "l", "d", "!"]]
    assert_equal expected, cipher.split_message_into_groups_of_four_chars("Hello World!")
  end 
end 