class Dish < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :picture, PictureUploader
  
  has_many :favorites, foreign_key: 'dish_id', dependent: :destroy
  has_many :users, through: :favorites
  
  def self.search(search)
    if search
      Dish.where(['content LIKE ?', "%#{search}%"])
    else
      Dish.all
    end
  end
end
