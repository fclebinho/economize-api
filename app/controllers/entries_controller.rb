class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
		# TODO: Colocar filtros
    @entries = current_user.entries + current_user.guest_entries

    render json: @entries.to_json(include: [:users, :tags])
  end

  # GET /entries/1
  def show
    render json: @entry.to_json(include: [:users, :tags])
  end

  # POST /entries
  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = current_user.entries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:due_date, :title, :describe, :amount, :kind, :done)
    end
end
