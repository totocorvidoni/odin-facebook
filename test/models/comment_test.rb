require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test 'should be valid' do
    assert_not Comment.new.valid?
    assert Comment.new(author:  users(:pupe),
                       post:    posts(:one),
                       content: 'Lorem Ipsum').valid?
  end
end
