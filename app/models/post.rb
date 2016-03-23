class Post < ActiveRecord::Base
  belongs_to :users
  has_many :comments

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true, numericality: :only_integer
  validate :image_size

  private

  # アップロード画像のサイズを検証する
  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "5MBを超えています。5MB以下にしてください。")
    end
  end
end
