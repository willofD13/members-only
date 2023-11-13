class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {max: 15}
  validates :body, presence: true, length: {max: 50}
end
