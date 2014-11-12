class UsersController < ApplicationController

before_action :authenticate_user!


def show
  	@user = User.find( params[:id] )
  	if @user == current_user
		@photos = @user.photos
	else
		redirect_to root_path
	end
end



end
