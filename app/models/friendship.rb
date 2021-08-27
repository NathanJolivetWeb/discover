class Friendship < ApplicationRecord
  belongs_to :requester, class_name: 'User', dependent: :destroy
  belongs_to :addressed, class_name: 'User', dependent: :destroy
end
