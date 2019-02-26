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

    assert_equal "040895", cipher.date
  end 

  def test_it_can_cipher_a_message_with_a_key_and_a_date
    skip
    cipher = Cipher.new("hello world", "02715", "040895")

    expected = {
      cipherion: "keder ohulw",
      key: "02715",
      date: "040895"
   }
    assert_equal expected, cipher.execute 
  end 
end 