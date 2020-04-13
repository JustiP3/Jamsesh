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
    @tag = Tag.new 
    @user = User.new 
    @users = User.all 
  end

  def create   
    @band = Band.new(band_params)    
    @user = User.find_by(user_params)       

    if @band.save 
      @tag = Tag.find_or_create_by(tag_params) 

      @band.tags << @tag 
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
    @band = Band.find(params[:id])
    @user = User.find_by(user_params)

    if @user && @band 
      @band.users << @user unless @band.users.find {|band_member| band_member.username == @user.username}
    end 

    if @band 
      unless @band.update(band_params)
        render :edit 
      end 
    end 


    redirect_to band_path(@band)
  end 

  def destroy 
    @band = Band.find(params[:id])
    @band.destroy 
    redirect_to root_path
  end 
 

  private 

  def band_params
    params.require(:band).permit(:name, :location, :tag)
  end 
  
  def user_params
    params.require(:user).permit(:username)
  end

  def tag_params 
    params.require(:tag).permit(:name)
  end 

end
