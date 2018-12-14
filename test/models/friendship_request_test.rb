require 'test_helper'

class FriendshipRequestTest < ActiveSupport::TestCase
  def setup
    @requester = users(:toti)
    @requestee = users(:lepu)
    @request   = friendship_requests(:toti_lepu)
  end

  test 'should generate friendship and delete request' do
    FriendshipRequest.accept(@request)
    assert @requester.friends_with?(@requestee)
    assert_not FriendshipRequest.where(from: @request.from,
                                         to: @request.to).exists?
  end
end
