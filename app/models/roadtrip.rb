class Roadtrip < ApplicationRecord
  has_many :itineraries
  has_many :messages
  has_many :partners
  has_many :tasks
end
