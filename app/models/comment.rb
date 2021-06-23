class Comment < ApplicationRecord
    validates :statement, presence: true
    belongs_to :post
    belongs_to :user
end