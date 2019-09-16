class DishHashtag < ApplicationRecord
  belongs_to :dish
  belongs_to :hashtag
end
