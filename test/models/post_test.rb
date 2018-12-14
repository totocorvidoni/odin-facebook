require 'test_helper'

class PostTest < ActiveSupport::TestCase
 
  test 'should be valid' do
    assert_not Post.new.valid?
    assert Post.new(author:  users(:pupe),
                    title:   'Lorem',
                    content: 'Ipsum').valid?
  end
end
