#this is the runner file
require 'pry'
require_relative './enigma'

message_array = []
file = File.open(ARGV[0], "r")
file.readlines.each do |line|
  message_array << line.chomp
end
file.close

filewriter = File.open(ARGV[1], 'w')
enigma = Enigma.new
message_array.each_with_index do |message, i|
  encrypted_hash = enigma.encrypt(message,"02715", "040895")
  filewriter.write(encrypted_hash[:encryption])
  if i == (message_array.size - 1)
    puts "Created #{ARGV[1]} " +
         "with the key #{encrypted_hash[:key]} " +
         "and date #{encrypted_hash[:date]}"
  end
end
file.close


# ruby colors.rb red.txt blue.txt
# ARGV == ["red.txt", "blue.txt"]
# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"


#should ouput to the screen after writing

#the file it wrote to
#the key
#the date
