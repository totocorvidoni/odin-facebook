require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @pupe = users(:pupe)
    @toti = users(:toti)
    @lepu = users(:lepu)
  end

  test 'should be valid' do
    assert @pupe.valid?
  end

  test 'post association' do
    assert_equal @pupe.posts.first, posts(:one)
  end

  test 'comment association' do
    assert_equal @pupe.comments.first, comments(:two)
  end

  test 'commented posts' do
    assert_equal @toti.commented_posts.first, posts(:one)
  end

  test 'likes association' do
    assert_equal @lepu.likes.count, 2
  end

  test 'should display liked posts' do
    assert_equal @lepu.liked_posts, posts(:one, :two)
  end

  test 'friendships should go both ways' do
    assert @pupe.friends_with?(@toti)
    assert @toti.friends_with?(@pupe)
  end

  test 'should display request sent' do
    assert_equal @toti.requests_sent.first.to, @lepu
  end

  test 'should display request pending' do
    assert_equal @lepu.requests_received.first.from, @toti
  end
end
