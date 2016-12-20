class UserSession

 def self.login_response(user)

     response = Hash.new
     response[:userId] = user.id
     response[:userName] = user.name
     response[:email] = user.email
     response[:session_key] = user.sessions.last['session_key']
     response
  end


end