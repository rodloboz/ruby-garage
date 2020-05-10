class ModelsController < ApplicationController
  def index
    models = policy_scope(Model.where('name ILIKE ?', "#{params[:query]}%").limit(5))
    render models
  end
end
