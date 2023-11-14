class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable
    has_many :posts
    has_many :comments

    validates :username, presence: true, uniqueness: true, length: {in: 4..10}
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {in: 5..15}
end
