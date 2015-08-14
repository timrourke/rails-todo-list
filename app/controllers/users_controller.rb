class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(
  		user_params
  	)
  	if @user.save
  		session[:user_id] = @user.id

  		flash.notice = "#{@user.email} successfully created."

  		redirect_to '/'
  	else
  		flash.alert = 'Error. User was not created. Please try again.'
  		redirect_to '/users/signup'
  	end

  end

  private
  	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
