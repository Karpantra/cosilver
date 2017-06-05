class OffersController < ApplicationController

  def index
    @offers = Offer.all

    if (params[:search] == "")  || (params[:search] == nil)
      @flats = Flat.where.not(latitude: nil, longitude: nil)

    elsif params[:search]
      @flats = Flat.near(params[:search], 10)

    end

    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end


  def show
    @offer = Offer.find(params[:id])
    @offer_coordinates = { lat: @offer.flat.latitude, lng: @offer.flat.longitude }
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @offer = Offer.new
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
  end

  def update
  end

  def destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:content, :title, :price, :room_size, :photos)
  end
end
