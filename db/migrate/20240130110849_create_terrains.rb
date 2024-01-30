class CreateTerrains < ActiveRecord::Migration[7.1]
  def change
    create_table :terrains do |t|
      t.string :name
      t.string :address
      t.float :price

      t.timestamps
    end
  end
end
