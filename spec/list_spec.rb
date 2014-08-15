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

  it 'should return name and list when asked.' do
    expect(@test_list.name).to eq "school"
  end

end