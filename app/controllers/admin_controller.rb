class AdminController < ApplicationController

  def add_products
    begin
      product = Product.new(params.permit(:name,:price,:quantity))
    if product.save!
      success_message(20,product.id,'The product has been created successfully')
    end
    rescue Exception => error
      error_message(40,error.message)
    end
  end


end
