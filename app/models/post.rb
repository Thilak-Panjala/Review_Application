class Post < ApplicationRecord
  belongs_to :commantable, polymorphic: true
end
