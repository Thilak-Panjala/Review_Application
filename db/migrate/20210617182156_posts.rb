class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :review
    end
  end
end
