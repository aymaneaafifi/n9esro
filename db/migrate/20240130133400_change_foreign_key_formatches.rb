class ChangeForeignKeyFormatches < ActiveRecord::Migration[7.1]
  def change
    rename_column :matches, :user_id, :organizer_id
  end
end
