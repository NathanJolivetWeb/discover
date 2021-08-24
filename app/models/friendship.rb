class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :addressed, class_name: 'User'

end
