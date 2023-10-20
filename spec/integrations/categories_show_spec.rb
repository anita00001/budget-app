require 'rails_helper'

RSpec.describe 'Categories Show Page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])

    sign_in @user1
  end

  scenario 'Visit the categories show page' do
    visit category_path(@category)
    expect(page).to have_content('TRANSACTIONS')
  end

  scenario 'Categories show page details' do
    visit category_path(@category)
    expect(page).to have_content('Travelling')
    expect(page).to have_content('Clothing')
    expect(page).to have_content('$30')
  end

  scenario 'Categories show page details: Date' do
    visit category_path(@category)
    expect(page).to have_content(Time.now.strftime('%Y-%b-%d'))
  end

  scenario 'Link to create a new Transaction' do
    visit category_path(@category)
    click_link 'ADD NEW TRANSACTION'
    visit new_category_cash_flow_path(@category)
  end
end
