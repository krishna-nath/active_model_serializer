class UsersController < ApplicationController

   def signup
   begin
    user = User.new(user_params)
    if user.save!
      Session.create_session_for(user)
      success_message(20,UserSession.login_response(user),'user has been created successfully')
   end
    rescue Exception => error
      error_message(40,error.message)
   end
  end

  def login
   begin
   user = User.find_by_email(params[:email])
   if user && user.authenticate(params[:password])
     Session.create_session_for(user)
    success_message(20,UserSession.login_response(user),'user has been logged in successfully')
   else
    error_message(40,'user does not exist or aunthentication failed')
   end
   rescue Exception => error
     error_message(40,error.message)
   end
  end

  def logout
   begin
   if current_user
     current_user.sessions.last.destroy
     success_message(20,'','user has been logged out successfully')
   else
     error_message(40,'failed to logout')
   end
   rescue Exception => error
     error_message(40,error.message)
   end
  end

   def get_products
     begin
       products = Product.all.pluck(:name, :price)
       success_message(20,products,'Products fetched successfully')
     rescue Exception => error
       error_message(40,error.message)
     end
   end

  # add to cart
   def add_to_cart
     begin
     response = CartService.new(params).add_item(current_user)
     if response.kind_of?(Cart)
       success_message(40,'','product has been added to cart successfully')
        CART_LOGGER.info('your product has been added to the cart')
       # logger.debug "The article was saved and now the user is going to be redirected..."
       # ShoppingCartLogger.cart_logger('product has been added')
     elsif response.is_a?(Integer)
       error_message(20,"there is #{response} items left")
     else
       error_message(20,'failed to add product to the cart')
     end
     rescue Exception => error
       error_message(40,error.message)
     end
   end

   def delete_from_cart
     begin
       response = CartService.new(params).delete_item(current_user)
       if response.kind_of?(Cart)
         msg = response.destroyed ? Messages::CART_EMPTY : Messages::PRODUCT_DELETED_SUCCESS
         success_message(40,'',msg)
       else
         error_message(20,'failed to delete product to the cart')
       end
     rescue Exception => error
       error_message(40,error.message)
     end
   end

   def add_user_profile_pic
     begin
       pro = ProfilePicture.new(params.permit(:user_id,:photo))
       # image                        = Paperclip.io_adapters.for(params[:photo])
       # pro.photo = image
       pro.user_id = 1
       pro.save
       pro
     rescue Exception => e
       e.errors
     end
   end




  private

  def user_params
    params.permit(:name, :email, :password)
  end

end
