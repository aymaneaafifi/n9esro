# Purpose: Team model
class Team < ApplicationRecord
  belongs_to :match
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  validate :validate_user_join
  validate :validate_user_count


  # validates :match_id, length: { is: 2, message: "must have exactly two teams" }
  # validates :match_id, uniqueness: { message: "the team already exists" }

  validates :title, length: { minimum: 3, maximum: 18, message: "title should be between 3 and 18 characters" }

  private

    def validate_user_join
      if users.count > 0 && match.teams.where.not(id: id).joins(:users).where(users: { id: users.ids }).exists?
        errors.add(:base, "A user can only join one team of the match.")
      end
    end

    def validate_user_count
      if users.count > 5
        errors.add(:base, "A team must have maximum 5 users.")
      end
    end
end
