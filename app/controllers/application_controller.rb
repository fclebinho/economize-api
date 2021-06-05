class ApplicationController < ActionController::API
	def current_user
    keycloak_id = Keycloak::Helper.current_user_id(request.env)
    # User.active.find_by(keycloak_id: keycloak_id)
  end
end
