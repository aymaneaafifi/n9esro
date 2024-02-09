class CreateConnects < ActiveRecord::Migration[7.1]
  def change
    create_table :connects do |t|
      t.text :connected, array: true, default: []

      t.timestamps
    end
  end
end
