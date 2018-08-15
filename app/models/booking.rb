class Booking < ApplicationRecord
  belongs_to :superhero
  belongs_to :renter, class_name: "User"

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted denied) }

  scope :pending, -> { where(status: 'pending') }
end
