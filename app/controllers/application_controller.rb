class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= user_repo.by_id(session[:user_id]) if session[:user_id]
  end

  private

  def user_repo
    UserRepository.new(ROM.env)
  end
end
