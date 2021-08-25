class Roadtrip < ApplicationRecord
  has_many :itineraries
  has_many :messages
  has_many :partners, dependent: :destroy
  has_many :tasks
  has_many :users, through: :partners
end
