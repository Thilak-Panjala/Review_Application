class Post < ApplicationRecord
  belongs_to :commantable, polymorphic: true
  has_many :comments, dependent: :destroy
end
