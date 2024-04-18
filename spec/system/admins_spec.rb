require "rails_helper"

RSpec.describe "Admin", type: :system do
  include Devise::Test::IntegrationHelpers

  let(:admin) { FactoryBot.create(:admin) }
  let(:new_trader) { FactoryBot.create(:user, confirmed_at: Time.now) }

  before do
  # NOTICE: to use NyanCat, uncomment headless_chrome
  # driven_by :selenium, using: :headless_chrome
  end

  context "Admin Trader Management" do
    before do
      sign_in
    end

    it "creates a new trader" do
      visit pages_admin_path
      click_on "Create new Trader"
      fill_in "Email", with: new_trader.email
      fill_in "Password", with: new_trader.password
      fill_in "Password confirmation", with: new_trader.password_confirmation
      click_on "Create User"
      expect(page).to have_content(new_trader.email)
    end

    it "updates trader's email" do
      create_trader
      click_on "Edit"
      fill_in "Email", with: "updated-#{new_trader.email}"
      click_on "Update User"
      expect(page).to have_content("updated-#{new_trader.email}")
    end

    it "inspect's trader's credentials" do
      create_trader
      click_on "Inspect"
      expect(page).to have_content(new_trader.email)
    end

    it "shows all traders" do
      create_trader
      click_on "All Users"
      expect(page).to have_content(new_trader.email)
    end

    it "shows all unconfirmed traders" do
      create_trader
      click_on "Pending Confirmation"
      expect(page).to_not have_content(new_trader.email)
    end

    it "approves confirmed trader" do
      create_trader
      click_on "Pending Approval"
      expect(page).to have_content(new_trader.email)
    end

    it "shows all transactions" do
      expect(page).to have_content("Transactions")
    end
  end

  private

  def sign_in
    visit root_path
    click_on "Admin"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_on "Log in"
    expect(page).to have_content("Admin Dashboard")
  end

  def create_trader
    visit pages_admin_path
    click_on "Create new Trader"
    fill_in "Email", with: new_trader.email
    fill_in "Password", with: new_trader.password
    fill_in "Password confirmation", with: new_trader.password_confirmation
    click_on "Create User"
    expect(page).to have_content(new_trader.email)
  end
end
