require 'rails_helper'

RSpec.describe 'Cash Flows New Page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])

    sign_in @user1
  end

  scenario 'Visit the cash flows new page' do
    visit new_category_cash_flow_path(@category)
    expect(page).to have_content('ADD TRANSACTION')
  end

  scenario 'Create a new cash flow' do
    visit new_category_cash_flow_path(@category)
    fill_in '', with: 'Clothing'
    fill_in '', with: 30
    click_button 'Add Transaction'
    visit category_path(@category)
  end

  scenario 'Create a new cash flow with invalid inputs' do
    visit new_category_cash_flow_path(@category)
    fill_in '', with: ''
    fill_in '', with: ''
    click_button 'Add Transaction'
    visit new_category_cash_flow_path(@category)
    expect(page).to have_content('ADD TRANSACTION')
  end
end
