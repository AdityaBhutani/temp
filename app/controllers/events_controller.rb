class EventsController < ApplicationController
  before_action :set_event, only: %i[ show ]

  # GET /events
  def index
    events = if event_params[:public] == "true"
                    Event.public_events
                   elsif event_params[:public] == "false"
                    Event.private_events
                   else 
                    Event.all
                   end

    @events = events.map { |event| event.serialize }

    render json: @events
  end

  # GET /events/1
  def show
    render json: @event.serialize
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event.serialize, status: :created, location: @event.serialize
    else
      render json: @event.errors, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:event_type, :public, :repo_id, :actor_id)
    end
end
