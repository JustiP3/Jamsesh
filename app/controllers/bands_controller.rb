class BandsController < ApplicationController
  def index
    
    @bands = Band.all 
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new 
    @user = User.new 
    @users = User.all 
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def create
    @band = Band.new(band_params)
    @user = User.find_by(user_params)
    
    if @user.nil?
      @error = "User could not be found"
      render :new
    elsif @user && @band.save 
      @band.users << @user 
      redirect_to band_path(@band)
    else 
        render :new 
    end 
           
  end 

  
  def update
  end 
 

  private 

  def band_params
    params.require(:band).permit(:name, :location)
  end 
  
  def user_params
    params.require(:user).permit(:username)
  end

end
