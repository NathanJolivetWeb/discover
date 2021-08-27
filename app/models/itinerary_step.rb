class ItineraryStep < ApplicationRecord
  belongs_to :step
  belongs_to :itinerary
end
