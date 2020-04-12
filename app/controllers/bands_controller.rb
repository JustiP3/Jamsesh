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
    @tag = Tag.new 
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def create
    raise params.inspect 
    Tag.find_or_create_by(name: band_params[:tag])
    @band = Band.new(band_params)    
    @user = User.find_by(user_params)     

    if @band.save 
      @band.users << current_user 
      @band.users << @user if @user && User.find_by(id: @user.id) 
      redirect_to band_path(@band)
    else
      @user = User.new 
      @users = User.all 
      @tag = Tag.new 
      render :new 
    end            
  end 

  
  def update
  end 
 

  private 

  def band_params
    params.require(:band).permit(:name, :location, :tag)
  end 
  
  def user_params
    params.require(:user).permit(:username)
  end

end
