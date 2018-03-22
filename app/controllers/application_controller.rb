class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :load_searches

  def current_user
    @current_user ||= user_repo.by_id(session[:user_id]) if signed_in?
  end

  private

  def signed_in?
    session[:user_id].present?
  end  

  def self.expose(variable_name)
    define_method(variable_name) do
      @exposed_variables ||= {}
      @exposed_variables[variable_name] ||= yield
    end
    helper_method variable_name
  end
  
  def load_searches
    @searches = SearchResults::Loader.new(current_user).load
  end

  def user_repo
    UserRepository.new(ROM.env)
  end

  def authorize
    redirect_to '/', notice: "You need to sign in" unless current_user
  end
end
