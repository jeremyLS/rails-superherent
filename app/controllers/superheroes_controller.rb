class SuperheroesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @superhero = Superhero.find(params[:id])
  end

  def index
    if params[:query].present?
      @superheroes = Superhero.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @superheroes = Superhero.all
    end
  end
end
