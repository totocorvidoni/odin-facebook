class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 50 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :commented_posts, through: :comments, source: :post
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :initiated_friendships, class_name: 'Friendship',
                                   foreign_key: 'user_id'
  has_many :received_friendships,  class_name: 'Friendship',
                                   foreign_key: 'friend_id'
  has_many :friends_initiated, through: :initiated_friendships, source: :friend
  has_many :friends_received,  through: :received_friendships,  source: :user
  has_many :requests_sent,     class_name: 'FriendshipRequest',
                               foreign_key: 'from_id'
  has_many :requests_received, class_name: 'FriendshipRequest',
                               foreign_key: 'to_id'

  # Return all friendships joining the two types using |(Set Union)
  def friends
    friends_initiated | friends_received
  end

  # Returns true if the user is friends with provided user.
  def friends_with?(user)
    friends.include?(user)
  end

  # Returns true if there is a friend request waiting for aproval of the given user
  def pending_request?(user)
    requests_sent.where(to: user).any?
  end

  # Returns true if User likes given post
  def likes?(post)
    liked_posts.where(id: post).any?
  end

  # Returns the Like ID for user's like of the given post
  def like_id(post)
    likes.find_by(post: post).id
  end
end
