class AvailabilitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @service = Service.find(params[:service_id])
    @availability = Availability.new
  end


  def create
    @service = Service.find(params[:service_id])
    @availability = Availability.new(availability_params)
    @availability.service = @service

    if @availability.save
      respond_to do |format|
        format.html { redirect_to service_availabilities_path(@service) }
      end
    else
      respond_to do |format|
        format.html { render 'services/show' }
        # format.js  # <-- idem
      end
    end
  end

  private

   def availability_params
     params.require(:availability).permit(:day, :start_time, :end_time, :service_id)
   end
end
