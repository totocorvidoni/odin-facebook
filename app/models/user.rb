class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
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

  def friends_with?(id)
    friends.include?(User.find(id))
  end
end
