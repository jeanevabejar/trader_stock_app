require 'rails_helper'

RSpec.describe User, type: :model do
  # testing associations using shoulda gem
  describe User do
    it { should have_many(:transactions) }
    it { should have_many(:stocks) }
  end

  # testing associations w/o using shoulda gem
  context 'Associations' do

    it "has many transactions" do
      expect(User.reflect_on_association(:transactions).macro).to eq(:has_many)
    end

    it "has many stocks" do
      expect(User.reflect_on_association(:stocks).macro).to eq(:has_many)
    end
  end
end
