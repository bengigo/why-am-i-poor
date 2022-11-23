require 'rails_helper'

RSpec.describe 'Users', type: :model do
  before do
    @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
  end

  it 'name should be present' do
    @user.name = ''
    expect(@user).to_not be_valid
  end

  it 'name should be present' do
    @user.name = 'testUser'
    expect(@user.name).to eq('testUser') 
  end

  it 'email should be present' do
    @user.email = ''
    expect(@user).to_not be_valid
  end

  it 'email should be present' do
    @user.email = 'user@mail.com'
    expect(@user.email).to eq('user@mail.com')
  end
end