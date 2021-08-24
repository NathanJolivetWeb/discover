class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :requester_friendship, class_name: 'Friendship', foreign_key: 'requester_id'
  has_many :addressed, class_name: 'Friendship', foreign_key: 'addressed_id'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
