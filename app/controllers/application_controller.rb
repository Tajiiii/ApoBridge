class ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :company, :postcode, :address, :phonenumber, :email, :encrypted_password])
	end

  def after_sign_in_path_for(resource)
    services_path
  end

  def after_sign_up_path_for(resource)
    services_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
