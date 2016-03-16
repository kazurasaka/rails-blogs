require 'rails_helper'

RSpec.describe User, :type => :model do
  # nameが空欄のとき、エラーになること
  it 'error when the name is blank' do
    user = FactoryGirl.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # nameが30文字より多いとき、エラーになること
  it 'error when the name is over 30 character' do
    name = 'a' * 31
    user = FactoryGirl.build(:user, name: name)
    user.valid?
    expect(user.errors[:name]).to include('is too long (maximum is 30 characters)')
  end
  # emailが空欄のとき、エラーになること
  it 'error when the email is blank' do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  # emailに重複があるとき、エラーになること
  it 'error when the email is overlap' do
    user = FactoryGirl.create(:user, email: 'test@example.com')
    otherUser = FactoryGirl.build(:user, email: 'test@example.com')
    otherUser.valid?
    expect(otherUser.errors[:email]).to include('has already been taken')
  end
  # nameが30文字のとき、パスすること
  it 'pass when the name is under 30 character' do
    name = 'a' * 30
    expect(FactoryGirl.build(:user, name: name)).to be_valid
  end
  # nameとemailに正しい値が入っているとき、パスすること
  it 'pass when the name and email is correct value' do
    expect(FactoryGirl.build(:user)).to be_valid
  end
end
