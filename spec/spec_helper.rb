require 'rspec'
require 'pg'
require 'task'
require 'list'
require 'table_butler'

DB = PG.connect({:dbname => 'to_do'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM task *;")
    DB.exec("DELETE FROM list *;")
  end
end

def create_test_objects
    @test_list = List.new({'name' => 'school'})
    @test_list.save

    @test_task = Task.new({'name' => 'learn code', 'list_id' => @test_list.id})
    @test_task.save
end