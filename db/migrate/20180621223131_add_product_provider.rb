#comment

class AddProductProvider < ActiveRecord::Migration[5.1]
  def change
  	add_column :products, :provider, :string
  end
end
