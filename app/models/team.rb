





class Team < ApplicationRecord

  belongs_to :match
  has_many :user_teams, dependent: :destroy
  has_many :users , through: :user_teams

  validates :match_id, length: { is: 2, message: "just two teams" }
  validates :match_id, { uniqueness: :true , message: "the team is already existed" }

  validates :title , length: {minimum: 3, message: "short title"}
  validates :title , length: {maximum: 18, message: "long title"}

end
