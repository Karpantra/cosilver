class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    ###### Chat is not displayed anymore in the home. If troubles with chat decomment those lines #####
    # session[:conversations] ||= []

    # @users = User.all.where.not(id: current_user)
    # @conversations = Conversation.includes(:recipient, :messages)
    #                              .find(session[:conversations])
  end
end
