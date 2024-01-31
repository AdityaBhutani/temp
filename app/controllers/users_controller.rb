class UsersController < ApplicationController
  # GET /users
  def index
    @events = Event.where(actor_id: user_params[:user_id])

    render json: @events.map { |event| event.serialize }
  end

  private
  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:user_id)
  end
end
