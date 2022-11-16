require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create!(name: 'Diego', email: 'diego@gmail.com', password: 123_456)
  end

  let(:valid_attributes) do
    {
      name: 'Groceries',
      icon: 'GroceriesIcon',
      user: @user
    }
  end

  subject { Category.new valid_attributes }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an user' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'method name_with_emoji returns the name+emoji string' do
    expect(subject.name_with_emoji).to eq('Groceries GroceriesIcon')
  end
end
