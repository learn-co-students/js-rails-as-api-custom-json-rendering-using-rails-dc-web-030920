class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end
  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird, only: [:id, :name, :species]
    # render json: bird, except: [:created_at, :updated_at]
    if bird
      render json: bird, except: [:created_at, :updated_at]
    else
      render json: {message: "Bird NOT FREAKING FOUND"}
    end

  end
end