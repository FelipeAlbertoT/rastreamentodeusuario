class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show]
  
  def show
  end
  
  def create
    if User.exists?(email: params[:user][:email])
      @user = User.find_by(email: params[:user][:email])
      params[:user][:pages_attributes].each do |page|
        if Page.exists?(:name => page[:name], :user => @user)
          page[:id] = Page.find_by(:name => page[:name], :user => @user).id
        end
      end
      
      @user.update(user_params)
    else
      @user = User.new(user_params)
    end

    respond_to do |format|
      if @user.save
        format.json { render :show, status: :created, location: @user }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:email, :name, pages_attributes: [:id, :name, :url, :visited_at])
    end
  
end
