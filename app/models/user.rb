class User < ActiveRecord::Base

  has_secure_password
  include UserAction
  has_many :sessions
  has_many :carts
  has_many :products, :through => :carts

  validates_presence_of(:name,:email)
  validates           :email,  uniqueness: {
                                             case_sensitive: false,
                                             :message => "already has an account.Please try with a different email"
  }

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "is Invalid"


end
