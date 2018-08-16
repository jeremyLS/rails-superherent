class BookingsController < ApplicationController
  # before_action :set_user, only: [:index]
  before_action :set_superhero, only: [:new, :create]

  def index
    @current_user = current_user
    @bookings = Booking.all.where(renter: @current_user)
  end


  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @renter = current_user
    @booking.superhero = @superhero
    @booking.renter = @renter

    @rent_length = (@booking.end_date - @booking.start_date + 1).to_i

    @booking.end_date == @booking.start_date ? @booking.total_price = @superhero.daily_price : @booking.total_price = @superhero.daily_price * @rent_length

    if @booking.save
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

end
