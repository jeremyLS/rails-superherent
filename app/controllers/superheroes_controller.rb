class SuperheroesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    @superhero = Superhero.find(params[:id])
  end

  def index
    if params[:query].present?
      @superheroes = Superhero.near(params[:query], 20)
    else
      @superheroes = Superhero.where.not(latitude: nil, longitude: nil)
    end

    @markers = @superheroes.map do |superhero|
      {
        lat: superhero.latitude,
        lng: superhero.longitude,
        infoWindow: { content: render_to_string(partial: "superheroes/map_box", locals: { superhero: superhero }) }
      }
    end
  end
end
