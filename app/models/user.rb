class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  # has_many :friendships
  # has_many :friends, through: friendships
  # has_many :friend_requests_sent, class_name: 'FriendshipRequest', foreign_key: 'from'
  # has_many :friend_requests_received, class_name: 'FriendshipRequest', foreign_key: 'to'
end
