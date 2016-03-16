class Post < ActiveRecord::Base
  belongs_to :users
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true, numericality: :only_integer
end
