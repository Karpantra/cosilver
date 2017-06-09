class OffersController < ApplicationController

  def index

    if params[:search] == ""  || params[:search] == nil
      @flats = Flat.where.not(latitude: nil, longitude: nil).joins(:offers)
      @offers = Offer.all


    elsif params[:search]
      @flats = Flat.near(params[:search], 2).joins(:offers)
      @offers = []
      @flats.each do |flat|
        flat.offers.each do |offer|
          @offers << offer
        end
      end
    end

    @flat_properties = Array.new
    @flats.each do |flat|
      @flat_properties.push(flat)
    end


    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      concat_info_window = "#{flat.address + " " + flat.offers.last.title + " " + flat.offers.last.content}"
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.infowindow concat_info_window
    end
  end

#    def gmaps4rails_title
#       return "Hello all"
#     end


# def gmaps4rails_marker_picture
#   {
#    "picture" => "/images/logo.png",
#    "width" => 20,
#    "height" => 20,
#    "marker_anchor" => [ 5, 10],
#    "shadow_picture" => "/images/morgan.png" ,
#    "shadow_width" => "110",
#    "shadow_height" => "110",
#    "shadow_anchor" => [5, 10],
#   }
# end


  def show
    @offer = Offer.find(params[:id])
    @offer_coordinates = { lat: @offer.flat.latitude, lng: @offer.flat.longitude }
    ######### code below is here to make work the chat ###########
    session[:conversations] ||= []
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @offer = Offer.new
    if params[:modal] == "true"
      render 'new', layout: false
    else
      render 'new'
    end

  end

  def create
    @flat = Flat.find(params[:flat_id])
    @offer = Offer.new(offer_params)
    @offer.flat = @flat
    if @offer.save
      respond_to do |format|
        format.html { redirect_to offer_path(@offer) }
        # format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'offers/new' }
        # format.js  # <-- idem
      end
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to profile_users_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :title, :price, :room_size, :photos)
  end
end
