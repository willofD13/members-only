class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: {max: 15}
  validates :body, presence: true, length: {max: 50}
end
