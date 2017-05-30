class UsersController < ApplicationController

  def dashboard
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end


end
