# require 'rest-client'
# require 'json'
# require 'pry'
#
# def get_character_by_name_from_api(name)
#
#   response_string = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{name}")
#   response_hash = JSON.parse(response_string)
#
# end
#
# def get_more_info(url)
#   response_string = RestClient.get(url)
#   response_hash = JSON.parse(response_string)
# end
#
# def print_name(series_hash)
#   puts "Name: #{series_hash["name"]}"
#   # some iteration magic and puts out the movies in a nice list
# end
#
# def print_series(series_hash)
#   rtn_string = "Appeared in "
#   series_hash["tvSeries"].each_with_index {
#     |series,index|
#     if index < series_hash["tvSeries"].count-1
#       rtn_string << "#{series}, "
#     else
#       rtn_string << "and #{series}."
#     end
#   }
#   puts rtn_string
#   # some iteration magic and puts out the movies in a nice list
# end
#
# def print_played_by(series_hash)
#   puts "Played initially by #{series_hash["playedBy"][0]}."
# end
#
# def print_books(series_hash)
#   series_hash["books"].each do |book_data|
#     puts "#{book_data["name"]}, published by #{book_data["publisher"]} and written by #{book_data["authors"][0]}"
#   end
# end
#
# def show_character_tv_series(name)
#   series_array = get_character_by_name_from_api(name)
#
#   puts "-------------------------------"
#   print_name(series_array)
#   # print_series(series_array)
#   # print_played_by(series_array)
#   puts "-------------------------------"
# end
#
# ## BONUS
#
# # that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# # can you split it up into helper methods?




# =============================================================================


require 'rest-client'
require 'json'
require 'pry'

def get_character_by_name_from_api(name)
  #make the web request
  # response_string = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{char_name}")
  response_string = RestClient.get("https://anapioficeandfire.com/api/characters/?name=#{name.gsub!(" ", "%20")}")
  # response_string = response_string_before.gsub!(" ", "%20")
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
  input= gets.chomp
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
