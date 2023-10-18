class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:cash_flows).order(created_at: :desc).all
  end
end
