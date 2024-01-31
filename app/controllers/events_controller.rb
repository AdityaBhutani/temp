class EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy ]

  # GET /events
  def index
    events = if params[:public] == "true" 
                    Event.public_events
                   elsif params[:public] == "false"
                    Event.private_events
                   else 
                    Event.all
                   end

    @events = events.all.map { |event| event.serialize }

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

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event.serialize
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
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
