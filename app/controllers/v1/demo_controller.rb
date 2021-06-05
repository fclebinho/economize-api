class V1::DemoController < ApplicationController
  def index
		render json: current_user
  end
end
