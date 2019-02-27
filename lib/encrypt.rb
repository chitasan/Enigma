require './lib/enigma'
require 'csv'

read_file = ARGV[0]
write_file = ARGV[1]

read_file = File.open(read_file, "r")
message = read_file.read.chomp

enigma = Enigma.new

encryption = enigma.encrypt(message)

output = File.open(write_file, "w")
output.write(encryption[:encryption])

read_file.close
output.close

puts "Created #{write_file} with the key: #{encryption[:key]} and date: #{encryption[:date]}."