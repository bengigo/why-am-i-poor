require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers
  before do
    @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
    @group = Group.create(name: 'testGroup', icon: 'dndndndndndndn', user_id: @user.id)
    sign_in @user
  end

  it 'should show the groups page' do
    visit groups_path
    expect(page).to have_content('GROUPS')
  end

  it 'should direct to the new group page' do
    visit groups_path
    click_on 'Add a new group'
    expect(page).to have_content('NEW GROUP')
  end
end
