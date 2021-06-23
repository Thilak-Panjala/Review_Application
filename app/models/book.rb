class Book < ApplicationRecord
    validates :title, presence: true,uniqueness: {case_sensitive: false}
    validates :author, presence: true
    validates :rating, presence: true
end