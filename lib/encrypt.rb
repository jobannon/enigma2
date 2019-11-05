#this is the runner file
require 'pry'
require_relative './enigma'


file = File.open(ARGV[0], "r")

enigma = Enigma.new
message = file.readlines.first.strip
file.close

filewriter = File.open(ARGV[1], 'w')
filewriter.write(enigma.encrypt(message,"02715", "040895"))
file.close


# ruby colors.rb red.txt blue.txt
# ARGV == ["red.txt", "blue.txt"]
# ARGV[0] == "red.txt"
# ARGV[1] == "blue.txt"


#should ouput to the screen after writing

#the file it wrote to
#the key
#the date
