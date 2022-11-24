require 'rails_helper'

RSpec.describe 'Expenses', type: :model do
  before do
    @user = User.create(name: 'testUser', email: 'user@mail.com', password: 'password')
    @group = Group.create(name: 'testGroup', icon: 'dndndndndndndn', user_id: @user.id)
    @expense = Expense.create(name: 'testExpense', amount: 100, user_id: @user.id)
  end

  it 'name should be present' do
    @expense.name = ''
    expect(@expense).to_not be_valid
  end

  it 'name should be present' do
    @expense.name = 'testExpense'
    expect(@expense.name).to eq('testExpense')
  end

  it 'amount should be present' do
    @expense.amount = ''
    expect(@expense).to_not be_valid
  end

  it 'amount should be present' do
    @expense.amount = 100
    expect(@expense.amount).to eq(100)
  end

  it 'should belong to a user' do
    @expense.user_id = ''
    expect(@expense).to_not be_valid
  end

  it 'should belong to a user' do
    @expense.user_id = @user.id
    expect(@expense.user_id).to eq(@user.id)
  end
end
