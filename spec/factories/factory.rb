FactoryBot.define do
  factory :admin do
    email {"admin@avion.com"}
    password {"password"}
  end

  factory :user do
    email {"new_trader@email.com"}
    password {"password"}
    password_confirmation {"password"}
  end

end
