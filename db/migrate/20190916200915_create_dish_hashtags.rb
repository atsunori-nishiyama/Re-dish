class CreateDishHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_hashtags, id: false do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
