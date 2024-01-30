






class Match < ApplicationRecord
  belongs_to :terrain
  belongs_to :user
  has_many :teams, dependent: :destroy

  validates :user_id, uniqueness: { scope: :date, message: "et utilisateur doivent être uniques simultanément" }
  validates :title, length: { minimum: 3, maximum: 12, too_short: "short title", too_long: "long title" }
  validates :description, length: { minimum: 10, too_short: "short description" }
end
