class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :username, :password, :cpassword
  validates_presence_of :firstname, :lastname,:email, :username
  validates_uniqueness_of :email, :username
  validates_length_of :password, :minimum => 4
  has_secure_password
  validates_presence_of :password, :on => :create
end
