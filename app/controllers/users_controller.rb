class UsersController < ApplicationController
    before action 
    before_action :find_user, only: [:edit, :show, :update, :destroy]
    def index
        @users = User.all 
    end 
    def create 
    end 
    def new
        @user = User.new 
    end 
    def edit
    end 
    def show 
    end 
    def update
    end 
    def destroy
    end 

    private

    def user_params
        params.require(:users).permit(:name, :password, :instrument)
    end 

    def find_user
        @user = User.find_by(id: params[:id])
    end 
end
