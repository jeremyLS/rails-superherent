class SuperheroesController < ApplicationController
  def show
    @superhero = Superhero.find(params[:id])
  end
end
