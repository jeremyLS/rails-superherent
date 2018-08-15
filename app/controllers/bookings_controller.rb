class BookingsController < ApplicationController
  # before_action :set_user, only: [:index]
  def index
    @current_user = current_user
    @bookings = Booking.all.where(renter: @current_user)
  end


  def new
    @superhero  = Superhero.find(params[:superhero_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params_with_parsed_dates)

    @superhero             = Superhero.find(params[:superhero_id])
    @booking.superhero = @superhero

    number_of_days = (@booking.end_date - @booking.start_date).to_i

    total_price = number_of_days * @superhero.price

    @booking.total_price = total_price

    @booking.user = current_user


    if @booking.save
      redirect_to profile_path
    else
      render :new
    end

  end

  private

  def booking_params_with_parsed_dates
    params            = booking_params
    start_date_string = params.delete(:start_date)
    end_date_string   = params.delete(:end_date)

    start_date = Date.strptime(start_date_string, "%m/%d/%Y")
    end_date   = Date.strptime(end_date_string, "%m/%d/%Y")


    params[:start_date] = start_date
    params[:end_date]   = end_date

    return params
  end

  def booking_params
    params.require(:booking).permit(:purpose, :start_date, :end_date)
  end
end
