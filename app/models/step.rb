class Step < ApplicationRecord
  has_many :itinerary_steps
  has_many :itineraries, through: :itinerary_steps
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
