class UsersController < ApplicationController
  before_action :set_entry, :set_user, only: [:add_entry, :remove_entry]

  def add_entry
		@user.guest_entries << @entry

    render json: @entry.to_json(include: [:users, :tags]), status: :ok
  end

  def remove_entry
		@user.guest_entries.delete(@entry.id)

		render status: :ok
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = current_user.entries.find(params[:entry_id])
    end

		def set_user
      @user = User.find_by(email: params[:email])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :entry_id)
    end
end
