# Purpose: Team model
class Team < ApplicationRecord
  belongs_to :match
  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  # validates :match_id, length: { is: 2, message: "must have exactly two teams" }
  validates :match_id, uniqueness: { message: "the team already exists" }

  validates :title, length: { minimum: 3, maximum: 18, message: "title should be between 3 and 18 characters" }
end
