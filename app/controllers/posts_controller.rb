class PostsController < ApplicationController
    def edit
    end 
    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id 
        if @post.save
            redirect_to band_path(@post.band)
        else 
            @band = Band.find(post_params[:band_id])
            render :"/bands/show"
        end 
        
    end 
    def update
    end 
    def show 
    end 
    def destroy 
    end 

    private 

    def post_params
        params.require(:post).permit(:title, :content, :band_id)
    end 
end


rails g migration remove_field_name_from_table_name field_name:datatype