require 'pry'
require 'table_butler'
require 'pg'

class List < Table_Butler

attr_accessor:name, :id

def add_task(task)
    DB.exec("INSERT INTO list_task (task_id, list_id) VALUES ('#{task.id}', '#{@id}');")
  end

  def list_tasks
    tasks = []
    results = DB.exec("SELECT * FROM list_task WHERE list_id = #{@id};")
    results.each do |result|
      task_id = result["task_id"].to_i
      task_results = DB.exec("SELECT * FROM task WHERE id = #{task_id};")
      task_results.each do |task|
        task_name = task['name']
        new_task = Task.new({'name' => task_name, 'id' => task_id})
        tasks << new_task
      end
    end
    tasks
  end

end