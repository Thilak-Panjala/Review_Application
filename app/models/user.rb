class User < ApplicationRecord
    acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :username, presence: true
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
end