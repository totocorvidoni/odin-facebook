class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :users_who_commented, through: :comments, source: :author
  has_many :likes
  has_many :users_who_liked, through: :likes, source: :user

  validates :title, presence: true
  validates :content, presence: true

  scope :new_first,  -> { order(created_at: :desc) }

  # Returns the Like ID belonging to a given user
  def like_id(user)
    likes.find_by(user: user).id
  end
end
