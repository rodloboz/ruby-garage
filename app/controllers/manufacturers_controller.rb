class ManufacturersController < ApplicationController
  def index
    manufacturers = policy_scope(Manufacturer.search_by_name(params[:query])).limit(5)
    render manufacturers
  end
end
