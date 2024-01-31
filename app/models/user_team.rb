class UserTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
  # validation
  validates :user_id , uniqueness: { scope: :team_id, message: "user is already member in the team" }
  validate :user_has_no_team_for_same_date

  def user_has_no_team_for_same_date
    user_matches_dates = user.teams.map { |team| team.match.date }
    current_match_date = team.match.date

    if user_matches_dates.include?(current_match_date)
      errors.add(:base, "The user has already a team for the same date")
    end
  end
end
