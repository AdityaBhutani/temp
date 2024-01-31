class ReposController < ApplicationController
  # GET /repos
  def index
    @events = Event.where(repo_id: repo_params[:repo_id])

    render json: @events.map { |event| event.serialize }
  end

  private

  # Only allow a list of trusted parameters through.
  def repo_params
    params.permit(:repo_id)
  end
end
