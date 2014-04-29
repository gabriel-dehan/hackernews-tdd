require_relative 'spec_helper'
require_relative '../app/models/post'

class TestPostAttributes < Minitest::Unit::TestCase
  def setup
    @post = Post.new()
  end

  def test_post_has_url
    assert_respond_to(@post, :url)
  end

  def test_post_has_name
    assert_respond_to(@post, :name)
  end

  def test_post_has_rating
    assert_respond_to(@post, :rating)
  end

  def test_post_has_user_id
    assert_respond_to(@post, :user_id)
  end
end
