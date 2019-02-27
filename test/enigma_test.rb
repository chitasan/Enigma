require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end  

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end 

  def test_it_can_encrypt_a_message_with_a_key_and_a_date
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end 

  def test_it_can_decrypt_a_message_with_a_key_and_a_date
    expected = {
      decryption: "hello world!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw!", "02715", "040895")
  end 

  def test_it_can_encrypt_a_message_with_uppercase_letters
    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("Hello World!", "02715", "040895")
    assert_equal expected, @enigma.encrypt("HellO WorlD!", "02715", "040895")
    assert_equal expected, @enigma.encrypt("HELLO WORLD!", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_with_special_characters
    expected = {
      encryption: "keder ohulw!$",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("Hello World!$", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_with_special_characters
    expected = {
      decryption: "hello world!$",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("keder ohulw!$", "02715", "040895")
  end

  def test_it_can_encrypt_an_empty_string
    expected = {
      encryption: "c stc stc ",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("          ", "02715", "040895")
  end 

  def test_it_can_decrypt_an_empty_string
    expected = {
      decryption: "x hgx hgx ",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("          ", "02715", "040895")
  end 

  def test_it_can_encrypt_a_string_of_numbers
    expected = {
      encryption: "12345",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.encrypt("12345", "02715", "040895")
  end 

  def test_it_can_decrypt_a_string_of_numbers
    expected = {
      decryption: "12345",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, @enigma.decrypt("12345", "02715", "040895")
  end 

  def test_it_can_encrypt_a_message_with_key_and_no_date
    date = @enigma.generate_date

    assert_equal "02715", @enigma.encrypt("hello world!", "02715", date)[:key]

    actual = @enigma.encrypt("hello world!", "02715", date)[:encryption].class
    assert_equal String, actual
    
    expected = "hello world!".length
    actual = @enigma.encrypt("hello world!", "02715", date)[:encryption].length
    assert_equal expected, actual
  end 

  def test_it_can_decrypt_a_message_with_key_and_no_date
    date = @enigma.generate_date
    
    assert_equal "02715", @enigma.decrypt("keder ohulw!", "02715", date)[:key]
    assert_equal String, @enigma.decrypt("keder ohulw!", "02715", date)[:decryption].class
    assert_equal "hello world!".length, @enigma.decrypt("keder ohulw!", "02715", date)[:decryption].length
  end 

  def test_it_can_encrypt_a_message_with_no_key_no_date
    date = @enigma.generate_date
    key = @enigma.generate_key
    
    assert_equal String, @enigma.encrypt("hello world!", key, date)[:encryption].class

    actual = @enigma.encrypt("hello world!", "02715", date)[:encryption].length
    assert_equal "hello world!".length, actual 
  end 
  
  def test_it_can_decrypt_a_message_with_no_key_no_date
    date = @enigma.generate_date
    key = @enigma.generate_key
    
    assert_equal String, @enigma.decrypt("hello world!", key, date)[:decryption].class

    actual = @enigma.decrypt("hello world!", "02715", date)[:decryption].length
    assert_equal "hello world!".length, actual 
  end 
end 