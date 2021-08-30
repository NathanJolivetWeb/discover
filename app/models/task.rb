class Task < ApplicationRecord
  belongs_to :roadtrip
  has_many :partner_tasks, dependent: :destroy
  validates :content, length: { minimum: 4 }
end
