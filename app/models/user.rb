class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :email, :username, :password, :cpassword
  validates_presence_of :firstname, :lastname,:email, :username, :password
  validates_uniqueness_of :email, :username
  validates_length_of :password, :minimum => 4
end
