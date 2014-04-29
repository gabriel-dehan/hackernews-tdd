require_relative 'spec_helper'
require_relative '../app/models/post'

describe Post do
  describe 'attributes' do
    before do
      @post = Post.new
    end

    it 'must have an url' do
      @post.must_respond_to :url
    end

    it 'must have a name' do
      @post.must_respond_to :name
    end

    it 'must have a rating' do
      @post.must_respond_to :rating
    end

    it 'must have an user' do
      @post.must_respond_to :user_id
    end
  end

  describe 'validation' do
    before do
      @post = Post.new(url: 'www.google.com', name: 'Hello world', rating: 5, user_id: 1)
    end

    describe '#url' do
      it 'must exist' do
        @post.url = nil
        @post.valid?.must_equal false
      end

      it 'must not validate if the format does not match an url' do
        @post.url = 'google'
        @post.valid?.must_equal false
      end

      it 'must validate if the format match an url pattern' do
        @post.valid?.must_equal true
      end
    end

    describe '#name' do
      it 'must exist' do
        @post.name = nil
        @post.valid?.must_equal false
      end
    end

    describe '#rating' do
      it 'must exist' do
        @post.rating = nil
        @post.valid?.must_equal false
      end

      it 'must be a number' do
        @post.rating = 'hello'
        @post.valid?.must_equal false
      end
    end
  end

  describe 'connexion with database' do
    before do
      @post = Post.new(url: 'www.google.com', name: 'Hello world', rating: 5, user_id: 1)
    end

    it 'can create a new post' do
      @post.save.wont_equal false
    end
  end

end
