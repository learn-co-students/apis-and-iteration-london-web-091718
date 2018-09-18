require 'rest-client'
require 'json'
require 'pry'

def welcome
  puts "Good Morrow, mine eyes doth taketh interest in thee!"
end

def get_character_from_user
  print "Enter a name for the Many-Faced God: "
  gets.chomp
end
