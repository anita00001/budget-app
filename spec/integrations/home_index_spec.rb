require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  scenario 'Visit the home page' do
    visit root_path
    expect(page).to have_content('Budget Buddy')
  end

  scenario 'Visit the home page and click on login button' do
    visit root_path
    click_on 'Login'
    expect(page).to have_content('Log in')
  end

  scenario 'Visit the home page and click on sign up button' do
    visit root_path
    click_on 'Sign Up'
    expect(page).to have_content('Sign up')
  end

  scenario 'Visitor can see login and sign up buttons' do
    visit root_path

    expect(page).to have_selector('.home-container')
    expect(page).to have_selector('.app-name', text: 'Budget Buddy')

    within('.btn-wrapper') do
      expect(page).to have_link('Login', href: new_user_session_path, class: 'login-btn')
      expect(page).to have_link('Sign Up', href: new_user_registration_path, class: 'sign-up-btn')
    end
  end
end
