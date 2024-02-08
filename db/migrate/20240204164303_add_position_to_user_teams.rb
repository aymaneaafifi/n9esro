class AddPositionToUserTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :user_teams, :position, :string
  end
end
