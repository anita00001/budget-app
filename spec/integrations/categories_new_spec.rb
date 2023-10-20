require 'rails_helper'

RSpec.describe 'Categories New Page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])

    sign_in @user1
  end

  scenario 'Visit the categories new page' do
    visit new_category_path
    expect(page).to have_content('ADD CATEGORY')
    expect(page).to have_content('Category name')
    expect(page).to have_content('Category type: select icon')
  end

  scenario 'Create a new category' do
    visit new_category_path
    fill_in 'Enter Category Name', with: 'Clothing'
    click_button 'Create Category'
    visit categories_path
  end
end
