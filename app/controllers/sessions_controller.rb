class SessionsController < ApplicationController
  def create
    user = repo.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def repo
    UserRepository.new(ROM.env)
  end
end