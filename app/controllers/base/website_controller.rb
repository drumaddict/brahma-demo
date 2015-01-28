class Base::WebsiteController < ApplicationController

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: :render_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActionController::RoutingError, with: :render_not_found
    rescue_from ActionController::UnknownController, with: :render_not_found
    rescue_from ::AbstractController::ActionNotFound, with: :render_not_found
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  protected
  def render_not_found(exception)
    notify_airbrake(exception)
    render template: "/errors/404", status: 404
  end

  def render_error(exception)
    notify_airbrake(exception)
    render template: "/errors/500", status: 500
  end

end



