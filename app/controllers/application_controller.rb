class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  rescue_from CanCan::AccessDenied do 
   	redirect_to root_path, notice: "page not found"
   end

  rescue_from ActiveRecord::RecordNotFound do 
    redirect_to root_path, notice: "record not found"
  end

before_action :is_signed_in?

def is_signed_in?

	if params["controller"] == "devise/registrations"

	else
		unless params["user"].nil?
			if 	!User.find_by_email(params["user"]["email"]).is_present?
				redirect_to root_path
			else
				
				destroy_user_session_path
			end

		end
	
end

end
end