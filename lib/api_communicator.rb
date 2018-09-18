require 'rest-client'
require 'json'
require 'pry'

def get_character_by_name_from_api(name)
  #make the web request
  # response_string = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{char_name}")
  response_string_before = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{name}")
  response_string = response_string_before.gsub!(" ", "%20")
  response_array = JSON.parse(response_string)
  response_hash = response_array[0]
  return response_hash
end

def inform_user_about_options(hash)
puts "What info are you interested in?"
puts "You can ask about:"
puts hash.keys
end


def get_info_user_interested_in
  input= gets.chomp.downcase
end


def user_requested(response_hash,info)
  puts "Here's your info: "
  puts (response_hash[info])
end



def show_character_info(name)
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
