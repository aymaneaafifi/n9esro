class ChangeDescriptionToBeTextInMatches < ActiveRecord::Migration[7.1]
  def change
    change_column :matches, :description, :text
  end
end
