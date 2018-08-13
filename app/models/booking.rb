class Booking < ApplicationRecord
  belongs_to :superhero
  belongs_to :renter, class_name: "User"


end
