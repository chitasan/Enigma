require './test/test_helper'
require 'pry'

class CipherTest < Minitest::Test
  def test_it_exists 
    cipher = Cipher.new("hello world", "02715", "040895")

    assert_instance_of Cipher, cipher
  end 

  def test_it_can_encrypt_message_from_self
    cipher = Cipher.encrypt("hello world!", "02715", "040895")

    assert_equal 'keder ohulw!', cipher
  end

  def test_it_can_decrypt_message_from_self
    cipher = Cipher.decrypt("keder ohulw!", "02715", "040895")

    assert_equal 'hello world!', cipher
  end

  def test_it_can_encrypt_a_message
    cipher = Cipher.new("hello world!", "02715", "040895")
    assert_equal 'keder ohulw!', cipher.encrypt
  end 

  def test_it_can_decrypt_a_message
    cipher = Cipher.new("keder ohulw!", "02715", "040895")
    assert_equal 'hello world!', cipher.decrypt
  end

  def test_it_can_return_shifts_values
   cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [3, 27, 73, 20], cipher.shifts
  end 

  def test_it_can_return_negative_shifts
    cipher = Cipher.new("hello world!", "02715", "040895")

    assert_equal [-3, -27, -73, -20], cipher.negative_shifts
  end 
end