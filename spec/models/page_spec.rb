require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }
  
  it { is_expected.to belong_to(:user)}
  
  it { should validate_uniqueness_of(:name).scoped_to(:url, :user_id) }

  context "is valid" do
    it "has a valid factory" do
      expect(build(:page)).to be_valid
    end
  end
    
  context "is invalid" do
    it "without url" do
      page = build(:page, url: nil)
      page.valid?
      expect(page.errors[:url]).to include("can't be blank")
    end
    
    it "without name" do
      page = build(:page, name: nil)
      page.valid?
      expect(page.errors[:name]).to include("can't be blank")
    end
    
    it "Página sem usuario" do
      page = build(:page, user: nil)
      page.valid?
      expect(page.errors[:user]).to include("must exist")
    end
  end
end
