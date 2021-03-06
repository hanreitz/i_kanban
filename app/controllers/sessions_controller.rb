class SessionsController < ApplicationController
  
  def welcome
    user = User.find_by(id: session[:user_id])
    redirect_to user_path(user) unless user.nil?
  end

  def new
  end
  
  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    elsif user
      redirect_to login_path, alert: "#{user.errors.full_messages[0]}"
    else
      redirect_to login_path, alert: "User not found."
    end
  end

  def omniauth
    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.username = request.env['omniauth.auth'][:info][:email]
      u.first_name = request.env['omniauth.auth'][:info][:first_name]
      u.last_name = request.env['omniauth.auth'][:info][:last_name]
      u.email = request.env['omniauth.auth'][:info][:email]
      u.password = SecureRandom.hex(15)
    end
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to login_path, alert: "#{user.errors.full_messages[0]}"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end