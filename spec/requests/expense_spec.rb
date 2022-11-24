require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
      @group = Group.create(name: 'testGroup', icon: 'dndndndndndndn')
      @expense = Expense.create(name: 'testExpense', amount: 100, user_id: @user.id)
    end
    it 'is an HTTP request' do
      get @expense_path
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      get @expense_path
      expect(response).to render_template(:index)
    end
  end
end
