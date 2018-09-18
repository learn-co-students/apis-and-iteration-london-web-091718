require 'rest-client'
require 'json'
require 'pry'

def get_character_books_from_api(character)
  #make the web request
  response_string = RestClient.get('https://anapioficeandfire.com/api/characters/')
  response_hash = JSON.parse(response_string)

 #get array of books require_relative
  books_url = []
  response_hash.each do |got_character|
    if got_character["name"].downcase == character
      books_url << got_character["books"]
    end
  end
  books_url
end

def print_books(books_url)
  book_titles = []
  books_url.flatten.each do |url|
    response_book = RestClient.get(url)
    book_hash = JSON.parse(response_book)
    book_titles << book_hash["name"]
  end
  puts book_titles
end

def show_character_books(character)
  books_url = get_character_books_from_api(character)
  print_books(books_url)
end


#-------------------------------------------------




def get_characters_from_book_api(book)
  response_books = RestClient.get('https://anapioficeandfire.com/api/books/')
  book_hash = JSON.parse(response_books)
  #create array of characters url
  characters_url = []
  book_hash.each do |got_books|
    #binding.pry
    if got_books["name"].downcase == book
    characters_url << got_books["characters"]
    end
  end
  characters_url
end


def print_characters(characters_url)
  character_names = []
  characters_url.flatten.each do |url|
    #binding.pry
    response_character = RestClient.get(url)
    character_hash = JSON.parse(response_character)
    if character_hash["name"] == ""
      character_names << character_hash["aliases"]
    elsif character_hash["name"] != ""
      character_names << character_hash["name"]
    end
  end
  puts character_names

end

def show_character_in_a_book (book)
  # ask user for name of book
  # return a list of all books associated with the character
  characters_url = get_characters_from_book_api(book)
  print_characters(characters_url)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
