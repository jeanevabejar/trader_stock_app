checklist:

Admin 
- [x] User Story #1: As an Admin, I want to create a new trader to manually add them to the app 
- [x] User Story #2: As an Admin, I want to edit a specific trader to update his/her details 
- [x] User Story #3: As an Admin, I want to view a specific trader to show his/her details 
- [x] User Story #4: As an Admin, I want to see all the trader that registered in the app so I can track all the traders 
- [x] User Story #5: As an Admin, I want to have a page for pending trader sign up to easily check if there's a new trader sign up 
- [x] User Story #6: As an Admin, I want to approve a trader sign up so that he/she can start adding stocks 
- [x] User Story #7: As an Admin, I want to see all the transactions so that I can monitor the transaction flow of the app

Trader
- [x] User Story #1: As a Trader, I want to create an account to buy and sell stocks
- [x] User Story #2: As a Trader, I want to log in my credentials so that I can access my account on the app
- [x] User Story #3: As a Trader, I want to receive an email to confirm my pending Account signup
- [x] User Story #4: As a Trader, I want to receive an approval Trader Account email to notify me once my account has been approved
- [ ] User Story #5: As a Trader, I want to buy a stock to add to my investment(Trader signup should be approved)
- [ ] User Story #6: As a Trader, I want to have a My Portfolio page to see all my stocks
- [ ] User Story #7: As a Trader, I want to have a Transaction page to see and monitor all the transactions made by buying and selling stocks
- [ ] User Story #8: As a Trader, I want to sell my stocks to gain money.

gems added:

gem "devise", "~> 4.9"

gem 'iex-ruby-client'

gem "tailwindcss-rails"

gems added for testing:

bun = 'bundle install'
=>  = 'then'

gem 'rspec-rails', '~> 6.1', '>= 6.1.1'
    bun => rails generate rspec:install

gem "nyan-cat-formatter"
    bun => gem install nyan-cat-formatter

gem 'shoulda-matchers', '~> 6.0'
    bun
    shoulda matchers in rails_helper.rb(line 66-71)

additional rspec vscode extension:

vscode-run-rspec-file
