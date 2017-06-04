class ProvidersController < ApplicationController
  def profile
    @provider = current_provider
  end

  def update
    @provider = Provider.find(params[:id])
    @provider.update(provider_params)
    redirect_to provider_path(@provider)
  end

  private

  def provider_params
    params.require(:provider).permit(:day, :start_time, :end_time)
  end
end
