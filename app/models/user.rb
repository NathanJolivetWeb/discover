class User < ApplicationRecord
  has_many :requester_friendships, class_name: 'Friendship', foreign_key: 'requester_id', dependent: :destroy
  has_many :addressed_friendships, class_name: 'Friendship', foreign_key: 'addressed_id', dependent: :destroy
  has_many :partners, dependent: :destroy
  has_many :roadtrips, through: :partners, dependent: :destroy
  has_many :friendships, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  validates :username, uniqueness: true
end
