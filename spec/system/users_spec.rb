require "rails_helper"

RSpec.describe "User", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user){ FactoryBot.create(:user, confirmed_at: Time.now, is_approved: true) }


  before do
  # NOTICE: to use NyanCat, uncomment headless_chrome
  # driven_by :selenium, using: :headless_chrome
  end

  context "Trader sign up" do

    it "can sign up" do
      visit root_path
      click_on "SIGN UP"
      fill_in "Email", with: "signup-#{user.email}"
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation
      click_on "Sign up"
      find('.Dashboard', wait: 10)

      expect(ActionMailer::Base.deliveries.last.to).to include("signup-#{user.email}")
      expect(ActionMailer::Base.deliveries.last.body.encoded).to include("Confirm my account")
    end
  end

  context "Trader trades" do
    before do
      sign_in
    end

    it "full-transaction" do
      deposit
      sleep 5 
      click_on 'Dashboard'
      sleep 5 
      fill_in "search", with: "tsla" 
      click_on '⌕'
      sleep 5 
      expect(page).to have_link('Buy')
      buy
      expect(page).to have_link('Sell')
      sell
      expect(page).to have_content('TSLA')
      sleep 5 
      click_on 'Profile'
      sleep 5 
      expect(page).to have_content('TSLA')
    end

    it 'edit user' do
      click_on 'Profile'
      sleep 3
      click_on "Edit Profile"
      fill_in "Email", with: "edited-#{user.email}"
      fill_in "Password", with: "edited-#{user.password}"
      fill_in "Password confirmation", with: "edited-#{user.password_confirmation}"
      fill_in "Current password", with: user.password
      click_on "Update"
    end
  end

  private

  def sign_in
    visit root_path
      click_on "SIGN IN"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
      find('.Dashboard', wait: 10)
  end

 def deposit
      click_on 'Profile'
      sleep 3 
      click_on 'Deposit'
      fill_in "Amount", with: 1000
      click_on 'submit-deposit'
 end

  def buy
    click_on 'Buy'
    fill_in "share amount", with: 2
    click_on 'buy-submit'
    sleep 5
  end

  def sell
    click_on 'Sell'
    fill_in "share amount", with: 1
    click_on 'sell-submit'
    sleep 5
  end
 
end
