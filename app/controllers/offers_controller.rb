class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

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
      redirect_to offer_path(@offer)
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
    params.require(:offer).permit(:content, :title, :price, :room_size)
  end
end
