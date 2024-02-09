class AddStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :status, :string , default: "offline", null: false
  end
end
