require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now())
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])
    
    sign_in @user1
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index, params: {}
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index, params: {}
      expect(response).to render_template('index')
    end

    it 'should render the category index action correctly' do
      get :index, params: {}
      expect(response).to be_successful
      expect(assigns(:categories)).to eq([@category])
    end
  end

  describe 'GET #show' do
    it "assigns @category, @cash_flow, and @total_amount and renders the show template" do
      get :show, params: { id: @category.id }
      expect(assigns(:category)).to eq(@category)
      expect(assigns(:cash_flow)).to eq([@cash_flow])
      expect(assigns(:total_amount)).to eq(@cash_flow.amount)
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new category and renders the new template" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    it "creates a new category and redirects to index" do
      expect {
        post :create, params: { category: { name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1 } }
      }.to change(Category, :count).by(1)
      expect(response).to redirect_to(categories_path)
    end

    it "does not create a new category and renders new template" do
      expect {
        post :create, params: { category: { name: '', icon: 'www.myicon/path/icon.png', user: @user1 } }
      }.to change(Category, :count).by(0)
      expect(response).to render_template("new")
    end
  end
end
