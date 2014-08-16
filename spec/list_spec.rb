require 'spec_helper'

describe List do
  before do
    create_test_objects
  end

    it 'initializes a list class with a name.' do
    expect(@test_list).to be_an_instance_of List
  end

  it 'will save the list to the lists database' do
    expect(List.all).to eq [@test_list]
  end

  it 'should return name of a list when asked.' do
    expect(@test_list.name).to eq "school"
  end

  it 'will add a task to the list and list the tasks' do
  	@test_list.add_task(@test_task)
  	expect(@test_list.list_tasks).to eq [@test_task]
  end

end