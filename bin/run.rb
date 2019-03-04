
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
name = get_name_from_user
show_character_info(name)
