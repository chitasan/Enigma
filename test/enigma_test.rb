require './test/test_helper'
require 'pry'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end 

  def test_it_can_encrypt_a_message_with_a_key_and_a_date
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end 

  def test_it_can_decrypt_a_message_with_a_key_and_a_date
    enigma = Enigma.new

    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw!", "02715", "040895")
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
    assert_equal expected, enigma.encrypt("HELLO WORLD!", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_special_characters
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw!$",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("Hello World!$", "02715", "040895")
  end

   def test_it_can_decrypt_a_message_with_special_characters
    enigma = Enigma.new

    expected = {
      decryption: "hello world!$",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw!$", "02715", "040895")
  end

  def test_it_can_encrypt_an_empty_string
    enigma = Enigma.new

    expected = {
      encryption: "c stc stc ",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.encrypt("          ", "02715", "040895")
  end 

  def test_it_can_decrypt_an_empty_string
    enigma = Enigma.new

    expected = {
      decryption: "x hgx hgx ",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("          ", "02715", "040895")
  end 

  def test_it_can_encrypt_a_message_with_key_and_no_date
    enigma = Enigma.new
    date = Date.today.strftime('%d%m%y')
    
    assert_equal "02715", enigma.encrypt("hello world!", "02715", date = nil)[:key]
    assert_equal String, enigma.encrypt("hello world!", "02715", date = nil)[:encryption].class
    assert_equal "hello world!".length, enigma.encrypt("hello world!", "02715", date = nil)[:encryption].length
  end 
end 