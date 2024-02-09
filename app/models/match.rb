class Match < ApplicationRecord
  belongs_to :terrain
  belongs_to :user
  has_one :team1, -> { where(title: 'team1') }, class_name: 'Team', foreign_key: 'match_id'
  has_one :team2, -> { where(title: 'team2') }, class_name: 'Team', foreign_key: 'match_id'

  attr_accessor :team
  attr_accessor :position

  after_create :create_teams



  validates :user_id, uniqueness: { scope: :date, message: "The user already joined the game" }
  validates :title, length: { minimum: 3, maximum: 15, too_short: "minimum 3 characters", too_long: "maximum 15 characters" }
  # validates :description, length: { minimum: 10, too_short: "Minimum 10 chracters" }


  private
  def create_teams
    # Create team1
    Team.create!(title: 'team1', match_id: self.id)

    # Create team2
    Team.create!(title: 'team2', match_id: self.id)
  end

end
