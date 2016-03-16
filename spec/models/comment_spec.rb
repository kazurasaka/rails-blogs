require 'rails_helper'

RSpec.describe Comment, :type => :model do
  # contentが空欄のとき、エラーになること
  it 'error when the content is blank' do
    comment = FactoryGirl.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include("can't be blank")
  end
  # user_idがnilのとき、エラーになること
  it 'error when the user_id is nil' do
    comment = FactoryGirl.build(:comment, user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include("can't be blank")
  end
  # user_idが数値以外のとき、エラーになること
  it 'error when the user_id is non-numeric' do
    comment = FactoryGirl.build(:comment, user_id: 'a')
    comment.valid?
    expect(comment.errors[:user_id]).to include("is not a number")
  end
  # post_idがnilのとき、エラーになること
  it 'error when the post_id is nil' do
    comment = FactoryGirl.build(:comment, post_id: nil)
    comment.valid?
    expect(comment.errors[:post_id]).to include("can't be blank")
  end
  # post_idが数値以外のとき、エラーになること
  it 'error when the post_id is non-numeric' do
    comment = FactoryGirl.build(:comment, post_id: 'a')
    comment.valid?
    expect(comment.errors[:post_id]).to include("is not a number")
  end
  # usre_idが同じもののとき、パスすること
  it 'pass when the usre_id is overlap' do
    comment = FactoryGirl.create(:comment, user_id: 1)
    expect(FactoryGirl.build(:comment, user_id: 1)).to be_valid
  end
  # post_idが同じもののとき、パスすること
  it 'pass when the post_id is overlap' do
    comment = FactoryGirl.create(:comment, post_id: 1)
    expect(FactoryGirl.build(:comment, post_id: 1)).to be_valid
  end
  # contentとidに正しい値が入っているとき、パスすること
  it 'pass when the content and user_id is correct value' do
    expect(FactoryGirl.build(:comment)).to be_valid
  end
end
