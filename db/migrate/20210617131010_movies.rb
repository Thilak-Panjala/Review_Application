class Movies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.float  :rating
    end
  end
end
