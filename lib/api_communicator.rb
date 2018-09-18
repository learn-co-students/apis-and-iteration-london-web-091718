require 'rest-client'
require 'json'
require 'pry'

def get_books
  #make the web request
  response_string = RestClient.get('https://anapioficeandfire.com/api/books/')
  response_hash = JSON.parse(response_string)
end

def print_books(books_hash)
  books_hash.each do |books|
    puts books["name"]
  end
end

def show_books
  response_hash = get_books
  print_books(response_hash)
end
# def show_character_movies(character)
#   films_array = get_book_publisher_from_api(publisher)
#   print_movies(films_array)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
