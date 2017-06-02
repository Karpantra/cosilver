class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end


  # def index
  #   search = params[:flat][:search]
  #   if search.to_s.size > 0
  #     @flats= Flat.near(search, 10).where.not(latitude: nil, longitude: nil)
  #        @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
  #        marker.lat product.latitude
  #        marker.lng product.longitude
  #   #   filter product where city = search
  #     end
  #   else
  #     @flats = Flat.where.not(latitude: nil, longitude: nil)
  #     @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
  #       marker.lat product.latitude
  #       marker.lng product.longitude
  #     # marker.infowindow render_to_string(partial: "/products/map_box", locals: { product: product })
  #     end
  #   end
  # end




  def show
    @offer = Offer.find(params[:id])
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
        format.html { render 'offers/show' }
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
