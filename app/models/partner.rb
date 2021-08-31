class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :roadtrip
  validates :user, uniqueness: { scope: :roadtrip, message: "Déjà participant" }
end
