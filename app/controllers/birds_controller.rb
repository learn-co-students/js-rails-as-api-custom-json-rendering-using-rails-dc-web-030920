class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species} # Only renders information that I want to see in the JSON on the browser.
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species) # Using .slice on hashes grabs the specific keys that you want.
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird, only: [:id, :name, :species]
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird, except: [:created_at, :updated_at]
  # end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' } # Renders a bird if found, but if not will render an error message
    end

  end

end