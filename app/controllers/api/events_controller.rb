class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  #before_action :authenticated?
  
  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  def create
    application = Application.find_by(url: request.env['HTTP_ORIGIN'])

    if Application.all.include?(application)
      @event = Event.new(event_params)
      @event.application = application
      
      if @event.save!
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
      
    else
      render json: "Unregistered application", status: :unprocessable_entity   
    end
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

end
