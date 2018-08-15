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
end


