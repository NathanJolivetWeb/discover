class Itinerary < ApplicationRecord
  belongs_to :roadtrip
  has_many :itinerary_steps
  has_many :steps, through: :itinerary_steps
end
