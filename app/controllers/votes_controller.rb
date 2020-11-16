class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    vote = current_user.votes.new(article_id: params[:article_id])
    unless vote.save
      flash[:warning] = 'You cannot vote an article more than once!'      
    end
    redirect_back
  end

  def destroy
    Vote.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
    redirect_back
  end
end
