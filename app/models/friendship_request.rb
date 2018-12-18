class FriendshipRequest < ApplicationRecord
  belongs_to :from, class_name: 'User'
  belongs_to :to, class_name: 'User'

  # Deletes the provided request and creates a friendship between the users
  def self.accept(request)
    Friendship.create!(user: request.from, friend: request.to)
    request.destroy
  end
end
