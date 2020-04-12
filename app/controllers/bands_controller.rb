class BandsController < ApplicationController
  def index
    
    @bands = Band.all 
  end

  def show
    @band = Band.find_by(id: params[:id])
    if @band 
      @post = @band.posts.build  
    else 
      redirect_to root_path 
    end 
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
    @band.users << current_user 
    @user = User.find_by(user_params)
    
    if @user.nil?
      flash[:message] = "User could not be found"
      redirect_to new_band_path
    end 

    if @user && @band.save 
      @band.users << @user 
      redirect_to band_path(@band)
    elsif @user  
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
