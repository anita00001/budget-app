class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:cash_flows).order(created_at: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon).merge(user_id: current_user.id)
  end
end
