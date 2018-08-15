class SuperheroesController < ApplicationController
  def show
    @superhero = Superhero.find(params[:id])
  end

  def index
    @superheroes = Superhero.all
  end
end
