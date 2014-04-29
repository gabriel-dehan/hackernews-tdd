class Post < ActiveRecord::Base
  validates :url, presence: true, format: { with: /(\w+\.)?\w+\.\w{2,4}/ }
  validates :name, presence: true
end
