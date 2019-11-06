#this is the runner file
require 'pry'
require_relative './enigma'

message_array = []
file = File.open(ARGV[0], "r")
file.readlines.each do |line|
  message_array << line.chomp
end
binding.pry
file.close

filewriter = File.open(ARGV[1], 'w')
enigma = Enigma.new
message_array.each_with_index do |message, i|
  encrypted_hash = enigma.encrypt(message,"02715", "040895")
  filewriter.write(encrypted_hash[:encryption])
  filewriter.write("\n")
  if i == (message_array.size - 1)
    puts "Created #{ARGV[1]} " +
         "with the key #{encrypted_hash[:key]} " +
         "and date #{encrypted_hash[:date]}"
  end
end
file.close
