class UsersController < ApplicationController
	 before_action :set_user, only: [:user_update]
	 layout "user_list", only: [:user_count]
	def user_count
		@users = User.where('is_present=?', true)
	end

	


	def user_update
		@user = User.find(params["user_id"])
		@user.update_attributes(is_present:false)

		redirect_to users_user_count_path

	end
	def set_user
      @user = User.find(params["user_id"])
    end
end
