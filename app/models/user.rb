class User < ApplicationRecord
  has_one_attached :photo
  has_many :requester_friendships, class_name: 'Friendship', foreign_key: 'requester_id'
  has_many :addressed_friendships, class_name: 'Friendship', foreign_key: 'addressed_id'
  has_many :partners, dependent: :destroy
  has_many :roadtrips, through: :partners, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
