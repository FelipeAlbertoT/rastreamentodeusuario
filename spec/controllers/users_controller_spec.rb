require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    let(:users_list){create_list(:user,10)}
  
    before(:each) do
      get :index
    end
    
    # assigns verifica se @users foi preenchido pelo metodo index
    it 'assigns all users as @users' do
        expect(assigns(:users)).to eq(users_list)
    end
  end

  describe 'GET #show/:id' do
    let(:user) { create(:user) }
    
    it 'should redirect to user' do
      get :show, params: { id: user.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE #destroy' do

    before :each do
      @user = FactoryGirl.create(:user)
    end
    
    context "success" do
      it "deletes the user" do
        expect{ 
          delete :destroy, params: { id: @user.id }
        }.to change(User, :count).by(-1)
      end
    end
  end
end
