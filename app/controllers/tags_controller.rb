class TagsController < ApplicationController
  before_action :set_tag, only: [:show]
  before_action :set_tag_by_title, only: [:remove_from_entry]
  before_action :set_entry, only: [:add_to_entry, :remove_from_entry]

	# GET /tags
	def index
		# TODO: Colocar filtros
		@tags = current_user.tags

		render json: @tags
	end

  # GET /tags/1
  def show
    render json: @tag
  end

  def add_to_entry
		@tag = current_user.tags.find_or_create_by(title: params[:title])
		@entry.tags << @tag

		render json: @entry.to_json(include: [:users, :tags]), status: :ok
  end

  def remove_from_entry
		@entry.tags.delete(@tag.id)

		@tag.destroy if @tag.entries.empty?

		render status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
			@tag = current_user.tags.find(params[:id])
    end

    def set_tag_by_title
			@tag = current_user.tags.find_by(title: params[:title])

			raise ActiveRecord::RecordNotFound unless @tag.present?
    end

		def set_entry
			@entry = current_user.entries.find(params[:entry_id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.permit(:id, :title, :entry_id)
    end
end
