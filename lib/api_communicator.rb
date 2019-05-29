require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash['results'].detect{|result| result['name'].downcase === character}
end

def print_movies(films_hash)
    films = films_hash['films'].each do |film|
      response_string = RestClient.get(film)
      response_hash = JSON.parse(response_string)
      puts ""
      puts "###############################################"
      puts ""
      puts "Title: #{response_hash['title']}"
      puts "Director: #{response_hash['director']}"
      puts "Release Date: #{response_hash['release_date']}"
    end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  if films_array
    print_movies(films_array)
  else
    puts ''
    puts 'Character not found :( '
    puts ''
  end
end
