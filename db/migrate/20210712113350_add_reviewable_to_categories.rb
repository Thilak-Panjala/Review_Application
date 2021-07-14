class AddReviewableToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories,:reviewable,:boolean
  end
end
