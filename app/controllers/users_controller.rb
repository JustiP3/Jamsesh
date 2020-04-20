class UsersController < ApplicationController
    before_action :find_user, only: [:edit, :show, :update, :destroy]
    skip_before_action :verified_user, only: [:new, :create]
    
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
            session[:user_id] = @user.id
            redirect_to root_path
        else 
            render :new 
        end 
    end 
    def new
        @user = User.new 
        @bands = Band.all 
    end 
    def edit
        redirect_to root_path unless current_user.id.to_s == params[:id].to_s
    end 
    def show 
    end 
    def update
        @user = current_user

        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render :edit
        end 
    end 

    def quit 
        if params[:id].to_s == current_user.id.to_s
            @band = Band.find(params[:band_id])
            @join = Userband.find_by(band_id: @band.id, user_id: current_user.id)
            @join.delete             
        end 
        redirect_to user_path(current_user)
    end 

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :instrument, :location, :bio, :email)
    end 

    def find_user
        @user = User.find_by(id: params[:id])
    end 
end
