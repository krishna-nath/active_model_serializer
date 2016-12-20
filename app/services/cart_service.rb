class CartService

def initialize(params)
  @params = params
end

def add_item(current_user)
   begin
    if  (remaining = (q=Product.find(@params[:productId])).quantity-@params[:quantity]) >= 0
      users_product =current_user.products  #using where we can reduce the steps
      product = users_product.find_by_id(@params[:productId]) if users_product.any?
    if product
       cart_entry = Cart.where("user_id = ? and product_id = ?",current_user.id, product.id).first
       cart_entry.update(:number_of_products => @params[:quantity]+cart_entry.number_of_products)
       product.update(:quantity => remaining)
       cart_entry
    else
      cart = Cart.new
      cart.user_id = current_user.id
      cart.product_id = @params[:productId]
      cart.number_of_products = @params[:quantity]
      if  cart.save!
        q.update(:quantity => remaining)
        cart
      end
    end
    else
      q.quantity
    end
  rescue Exception => error
    error.message
  end
end

def delete_item(current_user)
  begin
    cart_entry = Cart.where("user_id=? and product_id=?",current_user.id,@params[:productId]).first
   unless cart_entry.nil?
    remaining = cart_entry.number_of_products - @params[:quantity]
    if remaining > 0
      cart_entry.update(:number_of_products => remaining)
      remaining = 0
    else
      cart_entry.destroy
    end
    # CartProduct.update_cart_product(@params[:productId],@params[:quantity]+remaining)
    p = cart_entry.product
    p.update(:quantity =>p.quantity + @params[:quantity] + remaining )
    cart_entry
   end
  rescue Exception => error
    error.message
  end

end








end