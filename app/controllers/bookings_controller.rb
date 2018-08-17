class BookingsController < ApplicationController
  # before_action :set_user, only: [:index]
  before_action :set_superhero, only: [:new, :create]

  def index
    @current_user = current_user
    @bookings = Booking.all.where(renter: @current_user).reverse
    @pending_request = set_pending_request(@bookings)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking             = Booking.new(booking_params)
    @renter              = current_user
    @booking.renter      = @renter
    @booking.superhero   = @superhero

    if @booking.valid?
      @rent_length = set_rent_length(@booking)
      set_booking_total_price(@booking)
      @booking.save

      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:purpose, :start_date, :end_date)
  end

  def set_superhero
    @superhero = Superhero.find(params[:superhero_id])
  end

  def set_pending_request(bookings)
    i = 0
    bookings.each do |booking|
      if booking.status == 'pending'
        i += 1
      end
    end
    return i
  end

  def set_rent_length(booking)
    return (booking.end_date - booking.start_date + 1).to_i
  end

  def set_booking_total_price(booking)
    if booking.end_date == booking.start_date
      booking.total_price = @superhero.daily_price
    else
      booking.total_price = @superhero.daily_price * @rent_length
    end
  end
end
