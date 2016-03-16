class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :name, presence: true, length: {maximum: 30}
  validates :email, uniqueness: true, presence: true
end
