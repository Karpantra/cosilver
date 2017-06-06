class UsersController < ApplicationController

  def profile
    @user = current_user
    @conversations = Conversation.where("recipient_id = ? OR sender_id = ?", current_user.id, current_user.id).order('updated_at DESC')

    ######### code below is here to make work the chat ###########
    session[:conversations] ||= []

    ########## uncomment code below if chatbox with all users wanted ###################
    # @users = User.all.where.not(id: current_user)
    # @conversations = Conversation.includes(:recipient, :messages)
    #                              .find(session[:conversations])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_users_path
    else
      render :profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
