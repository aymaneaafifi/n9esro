class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # validation
  validates :user_id , uniqueness: { scope: :team_id, message: "user is already member in the team" }
  validate :user_has_no_team_for_same_date

  enum position: { GK: "GK", DF1: "DF1", DF2: "DF2", MD: "MD", ATK: "ATK" }

  validates :position, presence: true
  validates :position, uniqueness: { scope: :team_id, message: "has already been taken for this team" }

  private
  def user_has_no_team_for_same_date
    return unless team.present? # Add a check to handle nil team object

    if user.teams.exists?(match_id: team.match_id)
      errors.add(:base, "The user has already a team for the same date")
    end
  end
end
