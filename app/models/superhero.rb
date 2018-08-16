class Superhero < ApplicationRecord
  # CLOUDINARY
  mount_uploader :photo, PhotoUploader

  # GEOCODER
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :address, presence: true
end
