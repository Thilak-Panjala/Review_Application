class AddRatingToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :rating ,:float
  end
end
