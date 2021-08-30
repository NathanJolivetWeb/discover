class Step < ApplicationRecord
  has_many :itinerary_steps, dependent: :destroy
  has_many :itineraries, through: :itinerary_steps, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
