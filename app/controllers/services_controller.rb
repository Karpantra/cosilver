class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :index ]

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
    @service = Service.new(service_params)
    @service.save
    redirect_to service_path(@service)

  end

 private

  def service_params
    params.require(:service).permit(:category, :title, :price_per_hour, :description, :address, :latitude,
      :longitude)
  end
end
