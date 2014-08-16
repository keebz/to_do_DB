require 'pg'
require './lib/task'
require './lib/list'
require 'pry'

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

def create_list
	puts "Please name your list:"
	list_name = gets.chomp
	@current_list = List.new({'name' => list_name})
	@current_list.save
	puts @current_list.name + " has been added!"
	main
end

def list_lists
	List.all.each do |list|
		puts list.name
	end

	@id = nil
	puts "type the name of a list to modify it:"
	name = gets.chomp
	List.all.each do |selected_list|
		if name == selected_list.name
			@id = selected_list.id
		end
	end
	puts "Press [d] to delete this list or [t] to add a task or [l] to list all your tasks:"
	selection = gets.chomp
	if selection == 'd'
		List.all.each do |list|
			if list.id = @id
				list.delete
			end
		end

		List.all.each do |list|
		puts list.name
		end
		main

	elsif selection == 't'
		add_task(@id)
		main
	elsif selection == 'l'
		list_tasks(@id)
		main
	end

end

def add_task(list_id)	
	puts "Enter a task for your list:"
	task_input = gets.chomp
	current_task = Task.new({'name' => task_input})
	current_task.save
	List.all.each do |current_list|
		if list_id == current_list.id
			current_list.add_task(current_task)
		end
	end
end

def list_tasks(list_id)
	puts "Here are all of your tasks:"
	List.all.each do |current_list|
		if current_list.id == list_id	
		puts current_list.name + current_list.id.to_s	
			current_list.list_tasks.each_with_index do |task, index|
				puts (index + 1).to_s + ". " + task.name
			end
		end
	end
end


main