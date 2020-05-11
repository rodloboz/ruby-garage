class Manufacturers::ModelsController < ApplicationController
  def index
    manufacturer = Manufacturer.find(params[:manufacturer_id])
    models = policy_scope(manufacturer.models).pluck(:id, :name).sort
    render json: { options: models } 
  end
end