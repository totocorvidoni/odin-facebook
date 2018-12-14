class FriendshipRequestsController < ApplicationController
  def create
    request = FriendshipRequest.new(request_params)
    if request.save
      flash[:success] = 'Friend Request Sent!'
    else
      flash[:warning] = "We Were unable to send your request"
    end
    redirect_to users_path
  end

  private

    def request_params
      params.require(:request).permit(:from_id, :to_id)
    end
end
