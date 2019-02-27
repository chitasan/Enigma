require './lib/enigma'

read_file  = ARGV[0]
write_file = ARGV[1]
key        = ARGV[2]
date       = ARGV[3]

read_file = File.open(read_file, "r")
message = read_file.read.chomp

enigma = Enigma.new

decryption = enigma.decrypt(message, key, date)

output = File.open(write_file, "w")
output.write(decryption[:decryption])
read_file.close
output.close

puts "Created #{write_file} with the key: #{decryption[:key]} and date: #{decryption[:date]}."