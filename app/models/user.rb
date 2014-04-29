class User < ActiveRecord::Base

  EMAIL_REGEXP = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true, format: { with: EMAIL_REGEXP }
end
