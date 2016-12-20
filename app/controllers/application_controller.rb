class ApplicationController < ActionController::API
  include ApiHelper

  before_action :validate_session, :except => [:signup, :login, :logout, :add_products, :get_products, :add_user_profile_pic]


 def validate_session

   if Session.find_by_session_key(get_session_key).nil?
      error_message(40,'session has expired please login')
   end

   unless current_user.has_access?(params)
      error_message(40,'u dont have access to this api')
   end
 end

 def get_session_key
   request.headers['HTTP_SESSION_KEY']
 end

 def current_user
    session = Session.find_by_session_key(get_session_key)
    if session.roles == 2
     User.find_by_id(session.user_id)
    elsif session.roles == 1
     Admin.find_by_id(session.user_id)
    else
       nil
    end
    end

end
