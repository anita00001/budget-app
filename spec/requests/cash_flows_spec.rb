require 'rails_helper'

RSpec.describe CashFlowsController, type: :controller do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now())
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])
    
    sign_in @user1
  end

  describe 'GET #new' do
    it "renders the new template" do
      get :new, params: { category_id: @category.id }
      expect(response).to render_template("new")
    end

    it "assigns a new cash_flow to @cash_flow" do
      get :new, params: { category_id: @category.id }
      expect(assigns(:cash_flow)).to be_a_new(CashFlow)
    end

    it "assigns a new category to @category" do
      get :new, params: { category_id: @category.id }
      expect(assigns(:category)).to eq(@category)
    end

    it "assigns a new select_option to @select_option" do
      get :new, params: { category_id: @category.id }
      expect(assigns(:select_option)).to eq([@category])
    end
  end

  describe "POST #create" do
    it "creates a new cash_flow and redirects to category show page" do
      expect {
        post :create, params: { cash_flow: { name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category] }, category_id: @category.id }
      }.to change(CashFlow, :count).by(1)
      expect(response).to redirect_to(category_path(@category))
    end

    it "does not create a new cash_flow and renders new template" do
      expect {
        post :create, params: { cash_flow: { name: '', amount: 30, author_id: @user1.id, categories: [@category] }, category_id: @category.id }
      }.to change(CashFlow, :count).by(0)
      expect(response).to render_template("new")
    end
  end
end
