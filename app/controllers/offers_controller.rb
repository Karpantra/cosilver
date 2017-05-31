class OffersController < ApplicationController

  def index
    @offers = Offer.all(params[:offer_id])
  end

  def show
    @flat = Flat.find(params[:id])
    @offer = Offer.new
  end

  def new

  end

  def create
    @flat = Flat.find(params[:flat_id])
    @offer = Offer.new(offer_params)
    @flat.offer = @flat
    if @offer.save
      redirect_to flat_offer_path
    else
      render new
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
    param.require(:offer).permit(:content, :title, :price, :room_size)
  end
end
