class Comment < ApplicationRecord
    validates :statement, presence: true
    belongs_to :post
end