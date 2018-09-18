#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

# welcome
# number = get_number_from_user
# show_character_tv_series(number)

welcome
name= get_name_from_user
show_character_info(name)
