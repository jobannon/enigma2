#this is the runner file
require 'pry'
require_relative './enigma'


file = File.open(ARGV[0], "r")

enigma = Enigma.new
message = file.readlines.first.strip
file.close

filewriter = File.open(ARGV[1], 'w')
decrypted_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
decrypted_hash[:encryption]
filewriter.write(decrypted_hash[:decryption])
puts "Created #{ARGV[1]} " +
     "with the key #{decrypted_hash[:key]} " +
     "and date #{decrypted_hash[:date]}"
file.close
