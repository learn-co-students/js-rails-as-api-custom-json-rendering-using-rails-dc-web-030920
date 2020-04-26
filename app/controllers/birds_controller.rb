class BirdsController < ApplicationController
  # before_action :find_bird, only: [:show]

  def index 
      birds = Bird.all
      # render json: birds, only: [:id, :name, :species]
      # render json: birds.to_json(except: [:created_at, :updated_at])
      render json: birds, except: [:created_at, :updated_at]
  end

  # def new 
  #     @bird = Bird.new
  # end

  # def create 
  #     @bird = Bird.create(bird_params)
  #     redirect_to bird_path(@bird)
  # end
  
  def show 
    bird = Bird.find_by(id: params[:id])
    # render json: { id: bird.id, name: bird.name, species: bird.species}
    # render json: bird.slice(:id, :name, :species)
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

  # private 

  # def bird_params 
  #     params.require(:bird).permit(:name, :species)
  # end

  # def find_bird
  #     @bird = Bird.find(params[:id])
  # end

end