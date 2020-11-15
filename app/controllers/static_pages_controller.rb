class StaticPagesController < ApplicationController
  def about; end

  def home
    redirect_to categories_path if user_signed_in?
  end

  def help; end
end
