require './lib/cipher'
require './lib/generator'

class Enigma
  include Generator

  def encrypt(message, key = generate_key, date = generate_date)
    cipher = Cipher.encrypt(message, key, date)
    {
      encryption: cipher, 
      key: key, 
      date: date
    }
  end

  def decrypt(message, key = generate_key, date = generate_date)
    cipher = Cipher.decrypt(message, key, date)
    {
      decryption: cipher, 
      key: key, 
      date: date
    }
  end
end 