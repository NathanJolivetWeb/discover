class Roadtrip < ApplicationRecord
  has_one_attached :photo
  has_many :itineraries, dependent: :destroy
  has_many :messages
  has_many :partners, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :partners
  scope :filter_by_status, ->(status) { where status: status }
end
