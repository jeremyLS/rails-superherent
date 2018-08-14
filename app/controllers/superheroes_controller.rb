class SuperheroesController < ApplicationController
  def show
    @superhero = Superhero.new
  end
end
