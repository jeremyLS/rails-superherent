class Owner::BookingsController < ApplicationController

  def index
    @owner = current_user
    @bookings = []

    @owner.superheroes.each do |superhero|
      superhero.bookings.each do |booking|
        @bookings << booking if booking.status == "pending"
      end
    end
  end

  def validate
    booking = Booking.find(params[:id])
    booking.status = 'accepted'
    booking.save
    redirect_to owner_bookings_path
    # respond_to do |format|
    #   format.html { redirect_to owner_bookings_path }
    #   format.js
    # end
  end

  def decline
    booking = Booking.find(params[:id])
    booking.status = 'declined'
    booking.save
    redirect_to owner_bookings_path
    # respond_to do |format|
    #   format.html { redirect_to owner_bookings_path }
    #   format.js
    # end
  end

  private

  def bookings_params
    params.require(:booking).permit(:id)
  end

end

