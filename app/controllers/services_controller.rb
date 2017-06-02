class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :index, :show ]

  def show
    @service = Service.find(params[:id])
    @service_coordinates = { lat: @service.latitude, lng: @service.longitude }
  end

  def index
    @services = Service.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
      # marker.infowindow render_to_string(partial: "/services/map_box", locals: { service: service })
    end
  end


  def new
    @service = Service.new
  end

  def create
    @provider = current_provider
    @service = Service.new(service_params)
    @service.provider = @provider
    @service.status = 'pending'

    if @service.save
      respond_to do |format|
        format.html { redirect_to service_path(@service) }
      end
    else
      respond_to do |format|
        format.html { render 'services/show' }
        # format.js  # <-- idem
      end
    end
  end

 private

  def service_params
    params.require(:service).permit(:category, :title, :price_per_hour, :description, :address, :latitude,
      :longitude)
  end
end
