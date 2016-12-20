class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user
      t.references :product
      t.integer :number_of_products
    end
    add_index :carts, [:user_id, :product_id] , unique: true

  end
end
