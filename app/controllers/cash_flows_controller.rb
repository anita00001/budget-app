class CashFlowsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def new
    @select_option = Category.all
    @category = Category.find(params[:category_id])
    @cash_flow = CashFlow.new
  end

  def create
    @cash_flow = CashFlow.create(cash_flow_params)
    @category = Category.find(params[:category_id])
    @cash_flow.categories << @category
    if @cash_flow.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def cash_flow_params
    params.require(:cash_flow).permit(:name, :amount, :category_id).merge(author_id: current_user.id)
  end
end
