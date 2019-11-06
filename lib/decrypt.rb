#this is the runner file
require 'pry'
require_relative './enigma'

enigma = Enigma.new
file = File.open(ARGV[0], "r")
message = file.read
file.close

writer = File.open(ARGV[1], 'w')
encrypted_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
# encrypted_hash = enigma.decrypt(message, ARGV[2])
writer.write(encrypted_hash[:decryption])
puts "Created #{ARGV[1]} " +
     "with the key #{encrypted_hash[:key]} " +
     "and date #{encrypted_hash[:date]}"
file.close
