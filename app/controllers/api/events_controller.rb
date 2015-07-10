class API::EventsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # before_action :authenticated?
  
  # def create
  #   #application = Application.find_by(url: request.env['HTTP_ORIGIN'])

  #   render json: "Unregistered application", status: :unprocessable_entity unless application

  #   event = Event.new(event_params)
  #   #event.application = application
  #   if event.save!
  #     render json: event_params
  #   else
  #     render @event.errors, status: :unprocessable_entity
  #   end   
  # end

  # private

  # def event_params
  #   params.require(:event).permit(:name)
  # end

end
