class CartProduct

 def self.update_cart_product(product_id, quantity)
       product = Product.find_by_id(product_id)
       product.update(:quantity => quantity)
  end
end