class Dish < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :picture, PictureUploader
end
