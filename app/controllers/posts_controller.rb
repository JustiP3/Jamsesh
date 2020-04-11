class PostsController < ApplicationController
    def edit
    end 
    def create
    end 
    def update
    end 
    def show 
    end 
    def destroy 
    end 

    private 

    def post_params
        params.require(:post).permit(:title, :author, :content, :band_id)
    end 
end
