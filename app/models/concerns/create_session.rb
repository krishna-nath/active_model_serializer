module CreateSession
  extend ActiveSupport::Concern
  module ClassMethods
 def create_session_for(user)
  session = Session.new
  session[:user_id] = user.id
  session[:session_key] = session_key
  session[:roles] = 2
  session if session.save
 end

 def session_key
  random = SecureRandom.urlsafe_base64(nil,false)
  if Session.find_by_session_key(random).nil?
     random
  else
    session_key
  end
 end

 end
end
