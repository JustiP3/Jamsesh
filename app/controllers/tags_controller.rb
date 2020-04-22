class TagsController < ApplicationController
  def create 
    @tag = Tag.find_by(name: tag_params[:tag_name])
    @band = Band.find_by(name: tag_params[:band_name])

    if @tag 
      @tag.bands << Band.find_by(name: @band.name)
      @tag.save
    else 
      @band.tags.create(name: tag_params[:tag_name])
    end 
    
    redirect_to edit_band_path(@band)
  end

  def index 
    if search_params[:tag_name]
      @tags = []
      @tags << Tag.find_by(name: search_params[:tag_name])
    else 
      @tags = Tag.all
    end 
    
  end


  
  private 

  def tag_params 
    params.require(:tag).permit(:tag_name, :band_name)
  end 

  def search_params
    params.permit(:tag_name)
  end 
end
