require 'rails_helper'

RSpec.describe Post, :type => :model do
  # titleが空白のとき、エラーになること
  it 'error when the title is blank' do
    post = FactoryGirl.build(:post, title: nil)
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end
  # contentが空白のとき、エラーになること
  it 'error when the content is blank' do
    post = FactoryGirl.build(:post, content: nil)
    post.valid?
    expect(post.errors[:content]).to include("can't be blank")
  end
  # user_idが空白のとき、エラーになること
  it 'error when the user_id is blank' do
    post = FactoryGirl.build(:post, user_id: nil)
    post.valid?
    expect(post.errors[:user_id]).to include("can't be blank")
  end
  # user_idが数値以外のとき、エラーになること
  it 'error when the user_id is non-numeric' do
    post = FactoryGirl.build(:post, user_id: 'a')
    post.valid?
    expect(post.errors[:user_id]).to include("is not a number")
  end
  # imageが空白のとき、パスすること
  it 'pass when the image is blank' do
    expect(FactoryGirl.build(:post, image: nil)).to be_valid
  end
  # titleとcontentとuser_idが正しい値が入っているとき、パスすること
  it 'pass when the title and content and user_id is correct value' do
    expect(FactoryGirl.build(:post)).to be_valid
  end
end
