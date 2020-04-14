class CommentsController < ApplicationController
    before_action :find_post, only: [:create, :new, :index, :destroy]
    def new 
        @comment = Comment.new
    end 
    def create        
    
    end 
    def index 
    end 
    
    def destroy 
    end 

    private

    def comment_params
        params.require(:comment).permit(:content, :user_id, :post_id)
    end 

    def find_post
        @post = Post.find_by(id: params[:post_id])
    end 
end
