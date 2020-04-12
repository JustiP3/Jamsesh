class PostsController < ApplicationController
    def edit
    end 
    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id 
        unless @post.save
            flash[:message] = @post.error_string
        end 
        redirect_to band_path(@post.band)
        
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