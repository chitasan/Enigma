require './test/test_helper'
require 'pry'

class EncryptTest < Minitest::Test
  def test_it_exists 
    encrypt = Encrypt.new("hello world", "02715", "040895")

    assert_instance_of Encrypt, encrypt
  end 

  def test_it_has_message
    encrypt = Encrypt.new("hello world", "02715", "040895")

    assert_equal "hello world", encrypt.message
  end 

  def test_it_has_key
    encrypt = Encrypt.new("hello world", "02715", "040895")

    assert_equal "02715", encrypt.key
  end

  def test_it_has_date
    encrypt = Encrypt.new("hello world", "02715", "040895")

    assert_equal "040895", encrypt.date
  end 

  def test_it_can_encrypt_a_message_with_a_key_and_a_date
    encrypt = Encrypt.new("hello world", "02715", "040895")

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
   }
    assert_equal expected, encrypt.execute 
end 