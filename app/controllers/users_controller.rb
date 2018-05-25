class UsersController < ApplicationController
	 
	 layout "/layouts/user_list", only: [:user_count]
	def user_count
		@users = User.all
	end

	


	def user_update
		binding.pry
		@user = User.find(params["user_id"])
		@user.update_attributes(is_present:false)

		redirect_to users_user_count_path

	end
	def set_user
      @user = User.find(params["user_id"])
    end

    def user_unblock

    	@user = User.find(params["user_id"])
    	@user.update_attributes(is_present:false)

    	redirect_to users_user_count_path
    end
end
