require 'rails_helper'

RSpec.describe Expense, type: :model do
  before(:each) do
    @user = User.create!(name: 'Diego', email: 'diego@gmail.com', password: 123_456)
    @category = Category.create!(name: 'Food', icon: 'FoodIcon', user: @user)
  end

  let(:valid_attributes) do
    {
      name: 'Chicken',
      amount: 10,
      user: @user,
      category_ids: [@category.id]
    }
  end

  subject { Expense.new valid_attributes }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
