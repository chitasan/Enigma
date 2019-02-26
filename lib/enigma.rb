require './lib/cipher'

class Enigma
  def encrypt(message, key, date)
    cipher = Cipher.encrypt(message, key, date)
    {
      encryption: cipher, 
      key: key, 
      date: date
    }
  end

   def decrypt(message, key, date)
    cipher = Cipher.decrypt(message, key, date)
    {
      decryption: cipher, 
      key: key, 
      date: date
    }
  end
  
end 