class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @categories = Category.includes(:cash_flows).order(created_at: :desc).all
  end

  def show
    @category = Category.includes(:cash_flows).find(params[:id])
    @cash_flow = @category.cash_flows.order(created_at: :desc)
    @total_amount = @category.cash_flows.sum(&:amount)
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
