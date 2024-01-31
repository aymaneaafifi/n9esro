class ChangeDateToBeDatetimeInMatches < ActiveRecord::Migration[7.1]
  def change
    change_column :matches, :date, :datetime
  end
end
