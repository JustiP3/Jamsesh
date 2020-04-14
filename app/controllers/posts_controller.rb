class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :destroy]

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
        @comments = @post.comments 
    end 
    def destroy 
    end 

    private 

    def find_post
        @post = Post.find(params[:id])
    end 

    def post_params
        params.require(:post).permit(:title, :content, :band_id)
    end 
end

