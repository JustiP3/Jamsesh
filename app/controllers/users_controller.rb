class UsersController < ApplicationController
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
        #name, instrument, bio
        @user = User.new(params)
        if @user.update 
            redirect_to user_path(@user)
        else 
            render :edit
        end 
    end 
    def destroy
    end 

    private

    def user_params
        params.require(:users).permit(:name, :password, :instrument, :bio)
    end 

    def find_user
        @user = User.find_by(id: params[:id])
    end 
end
