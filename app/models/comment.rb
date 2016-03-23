class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validates :user_id, presence: true, numericality: :only_integer
  validates :post_id, presence: true, numericality: :only_integer
end
