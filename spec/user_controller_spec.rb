require_relative 'spec_helper'
require_relative '../app/controllers/user_controller'

describe UserController do
  before do
    @controller = UserController.new
  end

  describe 'Registration' do
    it { @controller.must_respond_to :register }

    it 'must take a name and an email' do
      ->{ @controller.register(1) }.must_raise ArgumentError
      ->{ @controller.register(1, 2, 3) }.must_raise ArgumentError
    end

    it 'must try to save the user to the database' do
      User.any_instance.expects(:save)
      @controller.register("name", "email@email.com")
    end

    describe 'if the parameters are corrects' do
      it 'must returns true' do
        @controller.register("name", "email@email.com").must_equal true
      end
    end

    describe 'if the parameters are not corrects' do
      it 'must returns false' do
        @controller.register("name", "email@.com").must_equal false
      end
    end

  end

  describe 'Login' do
    after do
      User.destroy_all if User.any?
    end

    it { @controller.must_respond_to :login }

    it 'must take a name and an email' do
      ->{ @controller.login(1) }.must_raise ArgumentError
      ->{ @controller.login(1, 2, 3) }.must_raise ArgumentError
    end

    it 'must check if the user exists' do
      User.expects(:where).returns(User.all)
      @controller.login("hello", "world")
    end

    it 'must return false if the user does not exists' do
      @controller.login("hello", "world").must_equal false
    end

    it 'must return true if the user exists' do
      User.create(name: "hello", email: "world@gmail.com")
      @controller.login("hello", "world@gmail.com").must_equal true
    end

  end

end
