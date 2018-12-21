require 'test_helper'

class UserIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @pupe = users :pupe
  end

  test 'will display a list of all users' do
    sign_in @pupe
    visit '/users'
  end
end
