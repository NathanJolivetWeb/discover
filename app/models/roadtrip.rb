class Roadtrip < ApplicationRecord
  has_one_attached :photo
  has_many :itineraries
  has_many :messages
  has_many :partners, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :partners
end
