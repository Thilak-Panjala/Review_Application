class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :review
      t.references :commantable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
