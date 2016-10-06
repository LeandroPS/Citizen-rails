class UsersController < ApplicationController
	def user_params
		params.require(:user).permit(:cidade_id)
	end
end