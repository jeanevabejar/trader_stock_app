require "rails_helper"

RSpec.describe "User", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:user){ FactoryBot.create(:user) }

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

  # context "Trader trades" do
  #   before do
  #     sign_in
  #   end

  #   it "updates trader's email" do
  #     create_trader
  #     click_on "Edit"
  #     fill_in "Email", with: "updated-#{new_trader.email}"
  #     click_on "Update User"
  #     expect(page).to have_content("updated-#{new_trader.email}")
  #   end

  #   it "inspect's trader's credentials" do
  #     create_trader
  #     click_on "Inspect"
  #     expect(page).to have_content(new_trader.email)
  #   end

  #   it "shows all traders" do
  #     create_trader
  #     click_on "All Users"
  #     expect(page).to have_content(new_trader.email)
  #   end

  #   it "shows all unconfirmed traders" do
  #     create_trader
  #     click_on "Pending Confirmation"
  #     expect(page).to_not have_content(new_trader.email)
  #   end

  #   it "approves confirmed trader" do
  #     create_trader
  #     click_on "Pending Approval"
  #     expect(page).to have_content(new_trader.email)
  #   end

  #   it "shows all transactions" do
  #     expect(page).to have_content("Transactions")
  #   end
  # end

  private

  def sign_in
    visit root_path
      click_on "SIGN IN"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Log in"
      find('.Dashboard', wait: 10)
  end
end
