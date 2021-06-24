class Movie < ApplicationRecord
    validates :title, presence: true,uniqueness: {case_sensitive: false}
    validates :director, presence: true
    validates :rating, presence: true
    has_many :posts, as: :commantable, dependent: :destroy
    scope :filter_by_movies, ->(title){where("title like ?","%#{title}%")}
end