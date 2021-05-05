class SessionsController < ApplicationController
  def welcome
    user = User.find_by(id: session[:user_id])
    redirect_to user_path(user) unless user.nil?
  end

  def new
  end
  
  def create
    user = User.find_by(username: params[:user][:username])
    return head(:forbidden) unless user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  # def create_from_omniauth
  # end

  def destroy
    session.clear
    redirect_to '/'
  end
end