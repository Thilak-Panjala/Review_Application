class AddAttributeToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :title, :string
    add_column :songs, :director, :string
    add_column :songs, :lyricist, :string
    add_column :songs, :singer, :string
  end
end
