require 'concerns/create_session'
class Session < ActiveRecord::Base

include CreateSession
belongs_to :user




end
