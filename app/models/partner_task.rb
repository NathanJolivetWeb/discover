class PartnerTask < ApplicationRecord
  belongs_to :partner
  belongs_to :task
end
