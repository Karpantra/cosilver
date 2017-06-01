class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new ]
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service)
    else
      render new
    end
  end

 private

  def service_params
    params.require(:service).permit(:category, :title, :price_per_hour, :description, :address)
  end
end
