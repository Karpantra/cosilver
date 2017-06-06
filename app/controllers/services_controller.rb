class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :index, :show ]

  def show
    @service = Service.find(params[:id])
    @service_coordinates = { lat: @service.latitude, lng: @service.longitude }
  end

  def index
     # @services = Service.all

    if (params[:search_city] == "" &&  params[:search_category] == "") || (params[:search_city] == nil &&  params[:search_category] == nil)
      @services = Service.where.not(latitude: nil, longitude: nil)

    elsif params[:search_city] && params[:search_category]
      @services = Service.near(params[:search_city], 10).where(category: params[:search_category])

    elsif params[:search_city] == "" && params[:search_category]
      @services = Service.where.not(latitude: nil, longitude: nil).where(category: params[:search_category])

    elsif params[:search_city] && params[:search_category] == ""
      @services = Service.near(params[:search_city], 10)

    end

    @hash = Gmaps4rails.build_markers(@services) do |service, marker|
      marker.lat service.latitude
      marker.lng service.longitude
    end
  end

  def new
    @service = Service.new
  end

  def create
    @provider = current_provider
    @service = Service.new(service_params)
    @service.provider = @provider
    if @service.save
      dates = params["availabilities"].split(",")
      dates.each do |date|
        availability = Availability.new
        availability.date = date
        availability.service = @service
        availability.save!
      end
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
    params.require(:service).permit(:status, :category, :title, :price_per_hour, :description, :address, :latitude,
      :longitude)
  end
end
