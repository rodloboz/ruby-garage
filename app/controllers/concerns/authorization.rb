# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit

    # Pundit: white-list approach.
    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    redirect_to(root_path)
  end

  def skip_pundit?
    params[:controller] == 'application' ||
      params[:controller] == 'errors' ||
      devise_controller? ||
      params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
