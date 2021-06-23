class ChangesInComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment, :string
    add_column :comments, :statement, :string
  end
end
