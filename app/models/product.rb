class Product < ActiveRecord::Base

 belongs_to :user
 has_many :carts
 has_many :users, :through => :carts

 validates :name , uniqueness: {
                                 case_sensitive: false,
                                 message: 'is already in the list please try update'
 }
end