class Friendship < ApplicationRecord
  belongs_to :requester
  belongs_to :addressed
  belongs_to :requester_id, class_name: 'User'
  belongs_to :addressed_id, class_name: 'User'

end
