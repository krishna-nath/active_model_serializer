ActiveModelSerializersExample::Application.routes.draw do
  # user routes
    post '/signup'                       =>        'users#signup'
    post '/login'                        =>        'users#login'
    post '/logout'                       =>        'users#logout'
    post '/AddToCart'                    =>        'users#add_to_cart'
    post 'DeleteFromCart'                =>        'users#delete_from_cart'
    post 'AddProfileImage'               =>        'users#add_user_profile_pic'

  # admin routes
    post '/AddProduct'                   =>        'admin#add_products'
end
