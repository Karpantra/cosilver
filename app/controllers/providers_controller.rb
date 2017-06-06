class ProvidersController < ApplicationController
  def dashboard
    @provider = current_provider

  end


  def new_service
    @service = Service.new
  end

  def update
    @provider = Provider.find(params[:id])
    @provider.update(provider_params)
    redirect_to provider_path(@provider)
  end

  private

  def provider_params
    # A modifier si besoin car faux
    params.require(:provider).permit(:email, :password, :first_name, :last_name)
  end
end
