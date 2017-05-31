class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:offer, :messages)
                                 .find(session[:conversations])
  end
end
