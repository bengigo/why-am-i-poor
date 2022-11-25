require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
      @group = Group.create(name: 'testGroup', icon: 'dndndndndndndn')
    end

    it 'is an HTTP request' do
      get groups_path
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      get groups_path
      expect(response).to render_template(:index)
    end
  end
end
