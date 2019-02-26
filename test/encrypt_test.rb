require './test/test_helper'
require 'pry'

class EncryptTest < Minitest::Test
  def test_it_exists 
    encrypt = Encrypt("hello world", "02715", "040895")

    assert_instance_of Encrypt, encrypt
  end 

  def test_it_has_message
    encrypt = Encrypt("hello world", "02715", "040895")

    assert_equal "hello world", encrypt.message
  end 

  def test_it_has_key
    encrypt = Encrypt("hello world", "02715", "040895")

    assert_equal "02715", encrypt.key
  end

  def test_it_has_date
    encrypt = Encrypt("hello world", "02715", "040895")

    assert_equal "040895", encrypt.date
  end 
end 