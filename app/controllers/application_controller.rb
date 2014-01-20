class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_filter :verify_authenticity_token

  helper_method :current_user

  def current_user
    if params[:api_key].present?
      return @current_user = User.where(api_key: params[:api_key]).first
    end

    super
  end

  def authenticate_user!
    if params[:api_key].present?
      render(json: {:message => "Unauthorized", :object => nil, :status => 401}, status: :unauthorized) unless current_user.present?
    else
      super
    end
  end

end
