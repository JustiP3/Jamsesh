class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :show, :update, :destroy]
    def index
        @band_id = params[:band_id]
        if @band_id 
            @users = Band.find_by(id: @band_id).users   
        else 
            @users = User.all 
        end 
    end 
    def create 
        @user = User.new(user_params)
        if @user.save
            session[:username] = @user.username
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 
    def new
        @user = User.new 
    end 
    def edit
    end 
    def show 
    end 
    def update
        @user = User.new(params)
        if @user.update 
            redirect_to user_path(@user)
        else 
            render :edit
        end 
    end 

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :instrument, :bio)
    end 

    def find_user
        @user = User.find_by(id: params[:id])
    end 
end
