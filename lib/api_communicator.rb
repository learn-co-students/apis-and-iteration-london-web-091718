require 'rest-client'
require 'json'
require 'pry'

def get_character_by_name_from_api(name)
  #make the web request
  response_string_before = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{name}")
  response_string = response_string_before.gsub!(" ", "%20")
  #this checks the url for the name and replaces the spaces with "%20"
  response_array = JSON.parse(response_string)
  response_hash = response_array[0]
  response_hash
  #returns the hash we are interested in
end

def inform_user_about_options(hash)
#lists the user's options
puts "What info are you interested in?"
puts "You can ask about:"
puts hash.keys
end


def get_info_user_interested_in
  #receives the info user is interested in
  input= gets.chomp.downcase
end


def user_requested(response_hash,info)
  #finds the info user wants in the array and prints it
  puts "Here's your info: "
  puts (response_hash[info])
end



def show_character_info(name)
  #calls all the aforementioned methods
  series_array = get_character_by_name_from_api(name)
  puts "========================"
  inform_user_about_options(series_array)
  puts "========================"
  info=get_info_user_interested_in
  puts "========================"
  user_requested(series_array,info)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
