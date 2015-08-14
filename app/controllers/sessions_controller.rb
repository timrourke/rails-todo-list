class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	@user = User.find_by_email(params[:email])

  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id

  		flash.notice = "#{@user.email} successfully logged in."

  		redirect_to '/'
  	else
  		flash.alert = "Username or password is incorrect."

  		redirect_to '/users/login'
  	end
  end

  def delete
  	session[:user_id] = nil

  	flash.notice = "Successfully logged out."

  	redirect_to '/users/login'
  end
end
