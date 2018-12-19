require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = posts(:one)
  end
 
  test 'should be valid' do
    assert_not Post.new.valid?
    assert Post.new(author:  users(:pupe),
                    title:   'Lorem',
                    content: 'Ipsum').valid?
  end

  test 'posts comments' do
    assert @post.comments.first, comments(:one)
  end

  test 'post likes' do
    assert @post.likes.count, 2
  end

  test 'users who commented' do
    assert @post.users_who_commented.first, users(:toti)
  end

  test 'users who liked' do
    assert @post.users_who_liked, users(:toti, :lepu)
  end
end
