require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  response_string = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{character}")
  response_hash = JSON.parse(response_string)
  # response_hash gives us a hash inside an array that contains all
  # our character's data.
  if response_hash[0]["books"].length == 0
    puts "Sorry, this character never appeared in the books!"
  elsif response_hash[0]["books"].length > 1
    books_url_array = response_hash[0]["books"]
  else
    books_url_array = response_hash[0]["povBooks"]
  end
  # assigns the values from the key "povBooks" to books_url_array.
  # because the hash is within an array, we first call on index [0]
end

def print_movies(books_url_array)
  book_names_array = []
  books_url_array.each do |url|
  # iterates through the array of URLs for the books.
    book_response_string = RestClient.get(url)
    book_response_hash = JSON.parse(book_response_string)
    # here we get our new hash from JSON called book_response_hash
    book_names_array << book_response_hash["name"]
    # we access the book name from our hash, with the key "name" and shovel
    # it into our empty array.
  end
  puts "\nHere is a list of books the character has appeared in:"
  puts book_names_array.join("\n")
end

def show_character_movies(character)
  books_array = get_character_movies_from_api(character)
  print_movies(books_array)
end
