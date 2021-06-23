class Movie < ApplicationRecord
    validates :title, presence: true,uniqueness: {case_sensitive: false}
    validates :director, presence: true
    validates :rating, presence: true
end