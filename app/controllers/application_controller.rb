class ApplicationController < ActionController::API
	def current_user
    keycloak_id = Keycloak::Helper.current_user_id(request.env)
    keycloak_email = Keycloak::Helper.current_user_email(request.env)
		
		# return { id: keycloak_id, email: keycloak_email, custom_attributes: keycloak_custom_attributes }
    User.find_or_create_by(id: keycloak_id, email: keycloak_email)
  end
end