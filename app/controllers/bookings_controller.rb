class BookingsController < ApplicationController
  # before_action :set_user, only: [:index]

  def index
    @current_user = current_user
    @bookings = Booking.all.where(renter: @current_user)
  end

end
