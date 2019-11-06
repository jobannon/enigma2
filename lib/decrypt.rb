#this is the runner file
require 'pry'
require_relative './enigma'

message_array = []
file = File.open(ARGV[0], "r")
file.readlines.each do |line|
    message_array << line.chomp
    binding.pry
end
file.close

enigma = Enigma.new

filewriter = File.open(ARGV[1], 'w')
message_array.each_with_index do |message, i|
  decrypted_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
  if i == (message_array.size - 1)
    binding.pry
  end
  filewriter.write(decrypted_hash[:decryption])
  if i == (message_array.size - 1)
    puts "Created #{ARGV[1]} " +
         "with the key #{decrypted_hash[:key]} " +
         "and date #{decrypted_hash[:date]}"
  end
end
