class UsersController < ApplicationController
before_action :no_user, only: [:new]
def new
	@user = User.new
end
def create
	@user = User.new(users_params)
	if @user.save
		session[:user_id] = @user.id
		redirect_to '/'
	else
		redirect_to '/signup'
	end
     	
end    
private
def users_params
  	params.require(:users).permit(:first_name, :last_name, :email, :password)
end 
end
