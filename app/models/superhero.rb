class Superhero < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :bookings
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :address, presence: true
end
