class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    #Using include: :reviews will call the .reviews method that is provided with 
    #the has_many :reviews macro, 
    #and will serialize the reviews as a nested array of JSON data.
    
    render json: dog_house, include: :reviews
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
