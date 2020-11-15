class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    if vote.save
      flash[:success] = 'You voted this article.'
    else
      flash[:warning] = 'You cannot vote an article more than once!'
    end
    redirect_back
  end
end
