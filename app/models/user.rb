class User < ActiveRecord::Base

  has_many :posts

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :password
  validates :password, confirmation: true

end
