class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]

  def new
    @service = Service.find(params[:id])
    @availability = Availability.new
  end

  private

   def availability_params
     params.require(:availability).permit(:day, :start_time, :end_time)
   end
end
