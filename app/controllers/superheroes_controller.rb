class SuperheroesController < ApplicationController
  def show
  end

  def index
    @superheroes = Superhero.all
  end
end
