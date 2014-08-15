require 'rspec'
require 'pg'
require 'tasks'
require 'lists'

DB = PG.connect({:dbname => 'to_do'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")

  end
end

def create_test_objects
    @test_task = Task.new({'name' => 'learn code'})
    @test_task.save
    @test_list = List.new({'name' => 'school'})
    @test_list.save

end