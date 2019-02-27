require './lib/enigma'

read_file = ARGV[0]
write_file = ARGV[1]

read_file = File.open(read_file, "r")
message = read_file.read.chomp

enigma = Enigma.new
key = "82648"
date = "240818"
decryption = enigma.decrypt(message, key, date)

write_file = File.open(write_file, "w")
write_file.write(decryption[:decryption])
read_file.close
write_file.close

puts "Created #{write_file} with the key: #{decryption[:key]} and date: #{decryption[:date]}."