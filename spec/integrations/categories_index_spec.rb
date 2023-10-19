require 'rails_helper'

RSpec.describe 'Categories Index Page', type: :feature do
  before do
    @user1 = User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
    @category = Category.create(name: 'Travelling', icon: 'www.myicon/path/icon.png', user: @user1)
    @cash_flow = CashFlow.create(name: 'Clothing', amount: 30, author_id: @user1.id, categories: [@category])

    sign_in @user1
  end

  scenario 'Visit the categories index page' do
    visit categories_path
    expect(page).to have_content('Categories')
  end

  scenario 'Link to create a new category' do
    visit categories_path
    click_link 'Add a new Category'
    visit new_category_path
  end

  scenario 'Category List' do
    visit categories_path
    expect(page).to have_content('Travelling')
    expect(page).to have_content('$30')
  end

  scenario 'Category added: Date' do
    visit categories_path
    expect(page).to have_content(Time.now.strftime('%Y-%b-%d'))
  end
end
