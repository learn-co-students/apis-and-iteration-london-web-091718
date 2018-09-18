def welcome
 # puts out a welcome message here!
 puts "Welcome to the Game of Thrones API."
end

def get_name_from_user
 puts "Please enter a character name"
 # use gets to capture the user's input. This method should return that input, downcased.
 gets.chomp.downcase
end
