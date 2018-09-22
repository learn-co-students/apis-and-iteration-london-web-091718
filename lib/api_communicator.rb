require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  url = "http://www.swapi.co/api/people?=#{character}"

  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)

  film_links = response_hash["results"].find { |data| data["films"]}
  film_data = film_links.collect { |data| JSON.parse(RestClient.get(data)) }
  film_data



end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each.with_index(1) do |data, index|
    puts "#{index} " + data["title"]
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
