class Owner::BookingsController < ApplicationController

  def index
    @owner = current_user
    @bookings = []

    @owner.superheroes.each do |superhero|
      superhero.bookings.each do |booking|
        @bookings << booking
      end
    end
  end

  def validate
    booking = Booking.find(params[:id])
    booking.status = 'accepted'
    booking.save
    redirect_to owner_bookings_path
  end

  def decline
    booking = Booking.find(params[:id])
    booking.status = 'delined'
    booking.save
  end

  private

  def bookings_params
    params.require(:booking).permit(:id)
  end

end



