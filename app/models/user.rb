class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password

  has_many :posts

  validates_presence_of :name
  validates_presence_of :email
  validates :password, :presence => true, :confirmation => true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user_password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nill
    end
  end

  def encrypt_password
    if password.present? 
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
