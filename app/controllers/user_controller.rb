class UserController
  def register(name, email)
    new_user = User.new(name: name, email: email)
    new_user.save ? true : false
  end

  def login(name, email)
    User.where(name: name, email: email).any?
  end
end
