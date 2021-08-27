class Itinerary < ApplicationRecord
  belongs_to :roadtrip
  has_many :itinerary_steps, dependent: :destroy
  has_many :steps, through: :itinerary_steps
end
