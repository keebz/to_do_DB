require 'spec_helper'

describe Task do
  before do
    create_test_objects
  end

  it 'initializes a task class with a name.' do
    expect(@test_task).to be_an_instance_of Task
  end

  it 'will save the task to the tasks database' do
    expect(Task.all).to eq [@test_task]
  end

  it 'should return name and list when asked.' do
    expect(@test_task.name).to eq "learn code"
    expect(@test_task.list_id).to eq @test_list.id
  end

end