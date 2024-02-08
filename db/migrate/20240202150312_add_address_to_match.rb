class AddAddressToMatch < ActiveRecord::Migration[7.1]
  def change
    add_column :matches, :address, :string
  end
end
