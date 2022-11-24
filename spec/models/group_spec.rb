require 'rails_helper'

RSpec.describe 'Groups', type: :model do
  before do
    @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
    @group = Group.create(name: 'testGroup', icon: 'dndndndndndndn', user_id: @user.id)
  end

  it 'name should be present' do
    @group.name = ''
    expect(@group).to_not be_valid
  end

  it 'name should be present' do
    @group.name = 'testGroup'
    expect(@group.name).to eq('testGroup')
  end

  it 'icon should be present' do
    @group.icon = ''
    expect(@group).to_not be_valid
  end

  it 'icon should be present' do
    @group.icon = 'dndndndndndndn'
    expect(@group.icon).to eq('dndndndndndndn')
  end
end
