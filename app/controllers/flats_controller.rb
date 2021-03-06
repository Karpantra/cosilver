class FlatsController < ApplicationController

  def show
    @flat = Flat.find(params[:id])
    @flat_coordinates = { lat: @flat.latitude, lng: @flat.longitude }
  end

  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)

    @flat_properties = Array.new
    @flats.each do |flat|
    @flat_properties.push(flat)
    end


    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      concat_info_window = "#{flat.description}"
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.infowindow concat_info_window
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
      if @flat.save
        redirect_to profile_users_path
      else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:category, :address,
      :city, :service_charges, :deposit, :description, :flat_area,
      :max_roommmates, :number_pieces, :smoker, :animals, :latitude,
      :longitude, photos: [])
  end

end
