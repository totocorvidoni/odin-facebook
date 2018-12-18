class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.new(friendship_params)
    if friendship.save
      FriendshipRequest.where(from: friendship.user, to: friendship.friend).delete_all
      flash[:success] = "You are now friends with #{friendship.user.name}!"
      redirect_to current_user
    end
  end

private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
