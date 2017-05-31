class UsersController < ApplicationController

  def dashboard
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end


end
