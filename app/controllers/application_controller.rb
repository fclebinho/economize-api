class ApplicationController < ActionController::API
	def current_user
		uri     = request.env["REQUEST_URI"]
    headers = request.env
    token   = Keycloak.service.read_token(uri, headers)

    keycloak_id = Keycloak::Helper.current_user_id(request.env)
    keycloak_email = Keycloak::Helper.current_user_email(request.env)
		keycloak_custom_attributes = Keycloak::Helper.current_user_custom_attributes(request.env)
		
		return { id: keycloak_id, email: keycloak_email, custom_attributes: keycloak_custom_attributes }
    # User.active.find_or_create_by(keycloak_id: keycloak_id, email: keycloak_email)
  end
end