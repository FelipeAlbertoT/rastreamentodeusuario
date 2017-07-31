require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  
  it { is_expected.to have_many(:pages)}
    
  context "is valid" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end
  
  context "is invalid" do
    it "without email" do
      user = build(:user, email: nil)
      
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    
    it "without name" do
      user = build(:user, name: nil)
      
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
