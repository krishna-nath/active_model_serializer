module ApiHelper

  def error_message(status,message)
     render json: {:status => status, :message => message}
  end


    def success_message(status,response,message)
      render json: {:status => status,:data => response, :message => message}
    end


end
