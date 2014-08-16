require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def main
puts "welcome to to do too!"
puts "Press [cl] to create a new list."
puts "Press [ll] to list all your to do lists."
puts "Press [x] to exit"

selection = gets.chomp

	if selection == 'x'
		exit
	elsif selection == 'cl'
		create_list
	elsif selection == 'll'
		list_lists
	else
		puts "invalid entry"
		main
	end
end



main