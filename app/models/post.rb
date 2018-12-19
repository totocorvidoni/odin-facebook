class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :users_who_commented, through: :comments, source: :author
  has_many :likes
  has_many :users_who_liked, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true
end
