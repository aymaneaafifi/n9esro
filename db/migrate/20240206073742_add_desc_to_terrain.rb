class AddDescToTerrain < ActiveRecord::Migration[7.1]
  def change
    add_column :terrains, :desc, :text
  end
end
