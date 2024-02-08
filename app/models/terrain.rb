




class Terrain < ApplicationRecord
  has_one_attached :photo

  # for searching
  include PgSearch::Model
  pg_search_scope :search_terrain,
  against: [ :name, :price, :address, :desc ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
  #
  has_many :matches
  validates :name, uniqueness: { scope: :address, message: "the name and address must be unique" }
  validates :price , comparison: { greater_than: 0 }
  validates :name , length: {minimum: 3, message: "short name"}
  validates :name , length: {maximum: 25, message: "long name"}
  validates :address , length: {minimum: 1, message: "short adrress"}
end
