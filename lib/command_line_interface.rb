require_relative 'api_communicator.rb'

def welcome
  # puts out a welcome message here!
  puts "Welcome to Game of Thrones books collection!"
end

def get_book_from_user
  get_books
  puts "please enter a book name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp.downcase
end
