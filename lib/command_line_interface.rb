def welcome
  puts "Welcome to the GOT fan database!"
end

def get_character_from_user
  puts "please enter a character"
  character_input = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

def get_book_from_user
  puts "please enter a book title"
  book_input = gets.chomp.downcase
end
