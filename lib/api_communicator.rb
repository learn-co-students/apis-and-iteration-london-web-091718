require 'rest-client'
require 'json'
require 'pry'

def get_books(user_input)
  #make the web request
  url = " "
  if user_input == "def"
    url = "https://anapioficeandfire.com/api/books/"
  else
    url = "https://anapioficeandfire.com/api/books?name='#{user_input}'/"
  end
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

def print_books(books_hash)
  books_hash.each do |books|
    puts books["name"]
  end
end

def show_books
  response_hash = get_books("def")
  print_books(response_hash)
end

def get_book_character(user_input)
  get_books
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
