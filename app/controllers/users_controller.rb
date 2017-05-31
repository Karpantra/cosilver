class UsersController < ApplicationController

  def dashboard
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:email, photos: [])
    end


end
