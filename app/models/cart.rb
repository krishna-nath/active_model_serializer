class Cart < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  attr_accessor :destroyed
  after_destroy :mark_destroyed


  def mark_destroyed
    self.destroyed = true
  end


end
