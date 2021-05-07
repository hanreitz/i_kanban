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

  def omniauth
    byebug
    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
      u.username = request.env['omniauth.auth'][:info][:email]
      u.first_name = request.env['omniauth.auth'][:info][:first_name]
      u.last_name = request.env['omniauth.auth'][:info][:last_name]
      u.password = SecureRandom.hex(15)
    end
    if user.save
      #login and redirect
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end