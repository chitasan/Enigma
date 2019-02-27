require './lib/enigma'

read_file = ARGV[0]
write_file = ARGV[1]

read_file = File.open(read_file, "r")
message = read_file.read.chomp

enigma = Enigma.new
key = "82648"
date = "240818"
encryption = enigma.encrypt(message, key, date)

write_file = File.open(write_file, "w")
write_file.write(encryption[:encryption])
read_file.close
write_file.close

puts "Created #{write_file} with the key: #{encryption[:key]} and date: #{encryption[:date]}."