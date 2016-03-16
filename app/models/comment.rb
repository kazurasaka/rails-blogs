class Comment < ActiveRecord::Base
  belongs_to :users
  belongs_to :posts

  validates :content, presence: true
  validates :user_id, presence: true, numericality: :only_integer
  validates :post_id, presence: true, numericality: :only_integer
end
