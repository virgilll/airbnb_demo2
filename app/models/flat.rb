class Flat < ApplicationRecord
  # reference to the user model. user_id and user (id)
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_location, against: :address, using: { tsearch: {
    prefix: true
  } }
end
