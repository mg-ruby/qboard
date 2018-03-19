class ApplicationController < ActionController::Base
  helper_method :current_user

  before_action :load_searches

  def current_user
    @current_user ||= user_repo.by_id(session[:user_id]) if signed_in?
  end

  private

  def signed_in?
    session[:user_id].present?
  end  

  def load_searches
    @searches = SearchResults::Loader.new(current_user).load
  end

  def user_repo
    UserRepository.new(ROM.env)
  end
end
