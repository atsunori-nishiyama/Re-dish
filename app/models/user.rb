class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :dishes
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverses_of_relationships, source: :user
  
  def follow(oter_user)
    unless self == oter_user
      self.relationships.find_or_create_by(follow_id: oter_user.id)
    end
  end
  
  def unfollow(oter_user)
    relationship = self.relationships.find_by(follow_id: oter_user.id)
    relationship.destroy if relationship
  end
  
  def following?(oter_user)
    self.followings.include?(oter_user)
  end
  
  def feed_dishes
    Dish.where(user_id: self.following_ids + [self.id])
  end
  
  has_many :favorites
  has_many :favposts, through: :favorites, source: :dish
  
  def like(dish)
    favorites.find_or_create_by(dish_id: dish.id)
  end

  def unlike(dish)
    favorite = favorites.find_by(dish_id: dish.id)
    favorite.destroy if favorite
  end
  
  def favpost?(dish)
    self.favposts.include?(dish)
  end
  
end
