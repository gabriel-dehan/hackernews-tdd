require_relative 'spec_helper'
require_relative '../app/models/user'

describe User do
  describe 'attributes' do
    before do
      @user = User.new
    end

    it 'must have an name' do
      @user.must_respond_to :name
    end

    it 'must have a email' do
      @user.must_respond_to :email
    end
  end

  describe 'validation' do
    before do
      @user = User.new(name: 'Jean Michel Olivier Sebastien', email: "roger@lewagon.org")
    end

    after do
      User.destroy_all if User.any?
    end

    describe '#name' do
      it 'must exist' do
        @user.name = nil
        @user.valid?.must_equal false
      end
    end

    describe '#email' do
      it 'must be unique' do
        cloned_user = @user.clone
        cloned_user.save

        @user.valid?.must_equal false
      end

      it 'must exist' do
        @user.email = nil
        @user.valid?.must_equal false
      end

      it 'must fail if it does not match an email pattern' do
        @user.email = "roger@"
        @user.valid?.must_equal false
      end

      it 'must validate if it matches an email pattern' do
        @user.valid?.must_equal true
      end
    end

  end
end
