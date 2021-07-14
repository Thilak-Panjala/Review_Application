class Song < ApplicationRecord
    validates :title, presence: true,uniqueness: {case_sensitive: false}
    validates :director, presence: true
    validates :singer, presence: true
    validates :lyricist, presence: true
    validates :rating, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
    has_many :posts, as: :commantable, dependent: :destroy
    include Filterable
end