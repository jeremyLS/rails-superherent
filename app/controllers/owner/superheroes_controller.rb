class Owner::SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all.where(owner: current_user)
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

  def update
    @superhero = Superhero.find(params[:id])
    @superhero.update(owner_superhero_params)
    @superheroes = Superhero.all.where(owner: current_user)


    if @superhero.save
      redirect_to owner_superheroes_path
    else
      render 'index'
    end
  end

  private

  def owner_superhero_params
    params.require(:superhero).permit(:name, :address, :power, :description, :good, :daily_price, :photo)
  end
end
