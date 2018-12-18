require 'test_helper'

class NewFriendTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  # TODO
  # def setup
  #   @pupe = users(:pupe)
  #   @lepu = users(:lepu)
  # end

  # test 'make a new friend' do
  #   sign_in @pupe
  #   get '/users'
  #   assert_not @pupe.friends_with?(@lepu)
  #   assert_select
  # end
end
