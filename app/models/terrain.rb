



class Terrain < ApplicationRecord
  has_many :matches
  validates :name, uniqueness: { scope: :address, message: "et adresse doivent être uniques simultanément" }
  validates :price , comparison: { greater_than: 0 }
  validates :name , length: {minimum: 3, message: "short name"}
  validates :name , length: {maximum: 12, message: "long name"}
  validates :address , length: {minimum: 1, message: "short adrress"}
end
