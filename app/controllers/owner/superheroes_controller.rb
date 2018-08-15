class Owner::SuperheroesController < ApplicationController
  def index

  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(owner_superhero_params)
    @owner = current_user
    @superhero.owner = @owner

    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render 'new'
    end
  end

  private

  def owner_superhero_params
    params.require(:superhero).permit(:name, :address, :power, :description, :good, :daily_price, :photo)
  end
end
