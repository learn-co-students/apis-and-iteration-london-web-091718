def welcome
  system('clear')
  puts 'Welcome to the StarWars API'
end

def get_character_from_user
  puts ''
  puts ''
  puts "Please enter a character"
  input = gets.strip
  puts ''
  puts 'Getting films for ' + input + ' ...'
  puts ''
  input.downcase
end
