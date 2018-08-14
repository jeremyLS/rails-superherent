class PagesController < ApplicationController
  def home
    @superheroes = Superhero.all
  end
end
