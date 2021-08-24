class Task < ApplicationRecord
  belongs_to :roadtrip
  has_many :partner_tasks
end
