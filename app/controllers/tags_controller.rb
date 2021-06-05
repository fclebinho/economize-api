class TagsController < ApplicationController
  before_action :set_tag, only: [:remove_from_entry]
  before_action :set_entry, only: [:add_to_entry, :remove_from_entry]

  def add_to_entry
		@tag = current_user.tags.find_or_create_by(title: params[:title])
		@entry.tags << @tag

		render status: :ok
  end

  def remove_from_entry
		@entry.tags.delete(@tag.id)

		@tag.destroy if @tag.entries.empty?

		render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
			@tag = current_user.tags.find(title: params[:title])
    end

		def set_entry
			@tag = current_user.entries.find(params[:entry_id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.permit(:title, :entry_id)
    end
end
