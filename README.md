# Enigma

Enigma is an encryption algorithm program based on the <a href="https://en.wikipedia.org/wiki/Caesar_cipher">Caesar Cipher</a>. 

This was created while a student at Turing School of Software and Design as a Final Individual Project. 

## Objective
The project uses TDD, OOP, SRP classes to encrypt and decrypt a message by four different shifts. Every fourth character will be shifted by the same shift value. Shift values are created by a key and a date, which is either given or as a generated random key or current date, if not given. The algorithm uses the lowercase alphabet with a space,(" "), as the 27th character.

## Installation
`$ git clone git@github.com:chitasan/Enigma.git`

## Testing
The project uses <a href="https://github.com/colszowka/simplecov"> SimpleCov</a> to test. 

`rake` runs the tests. 

## Go For It: Encrypt Or Decrypt Your Own Message 
The project also uses Command Line Interface to decrypt and encrypt any message.

### To encrypt:

Write your message in `message.txt`. 

Run the command line `ruby lib/encrypt.rb message.txt encrypted.txt` to encrypt the message.

Open `encrypted.txt` after the command is successfully executed to see the encryption.

### To decrypt:

`ruby lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818` to decrypt the message. 82648 is the key given in the `encrypt.rb` file and 240818 is the date given. 

Open `decrypted.txt` after the command is successfully executed to see the decryption.

