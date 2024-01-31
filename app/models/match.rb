class Match < ApplicationRecord
  belongs_to :terrain
  belongs_to :user
  has_many :teams, dependent: :destroy

  validates :user_id, uniqueness: { scope: :date, message: "The user already joined the game" }
  validates :title, length: { minimum: 3, maximum: 15, too_short: "minimum 3 characters", too_long: "maximum 15 characters" }
  validates :description, length: { minimum: 10, too_short: "Minimum 10 chracters" }
end
