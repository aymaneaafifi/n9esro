class AddLastOnlineAtToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_online, :datetime
  end
end
