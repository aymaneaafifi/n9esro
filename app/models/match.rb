class Match < ApplicationRecord
  belongs_to :terrain
  belongs_to :user
  has_one :team1, class_name: 'Team', foreign_key: 'match_id'
  has_one :team2, class_name: 'Team', foreign_key: 'match_id'


  validates :user_id, uniqueness: { scope: :date, message: "The user already joined the game" }
  validates :title, length: { minimum: 3, maximum: 15, too_short: "minimum 3 characters", too_long: "maximum 15 characters" }
  validates :description, length: { minimum: 10, too_short: "Minimum 10 chracters" }
  validate :validate_teams_count


  private
  def validate_teams_count
    if team1.present? && team2.present?
      errors.add(:base, "A match can only have at most two teams.")
    end
  end
end
