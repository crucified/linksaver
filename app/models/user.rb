require 'digest/sha1'
class User < ActiveRecord::Base
  has_many :contents

  attr_protected :hashed_password, :salt

  attr_accessor :password

  #добавить валидаторов

  before_save :create_hashed_password
  after_save :clear_password

  def self.hash_with_salt(password="", salt="")
    pass = Digest::SHA1.hexdigest("Put #{salt} on #{password}")
    pass
  end

  def password_match? (password = "")
    self.hashed_password == User.hash_with_salt(password, salt)
  end

  def self.authenticate(email = "", password = "")
    user = User.find_by_email(email)    
    if user && user.password_match?(password)      
      return user
    else
      return false #maybe return nil?
    end
  end

  def self.make_salt(salt_string="")
    Digest::SHA1.hexdigest("The string #{salt_string} was salted on #{Time.now}")
  end
  
  private
  def create_hashed_password
    unless password.blank?
      self.salt = User.make_salt(email) if salt.blank?
      self.hashed_password = User.hash_with_salt(password, salt)
    end
  end

  def clear_password
    self.password = nil
    Date.today()
  end
end
