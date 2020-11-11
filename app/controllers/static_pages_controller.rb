class StaticPagesController < ApplicationController
  before_action :authenticate_user! ,only: :home
  def about
  end

  def home
  end

  def help
  end
end
