class Dish < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  mount_uploader :picture, PictureUploader
  
  has_many :favorites, foreign_key: 'dish_id', dependent: :destroy
  has_many :users, through: :favorites
  
  def self.search(search)
   
      Dish.where(['content LIKE ?', "%#{search}%"])
    
  end
  
  # default_scope -> { order(created_at: :desc) }
  # scope :search_by_keyword, -> (keyword) {
  #   where("dishes.content Like :keyword", keyword: "%#{sanitize_sql_like(keyword)}%") if keyword.present?
  # }
  
end
